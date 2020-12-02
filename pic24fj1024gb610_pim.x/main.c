#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <stdbool.h>
#include <string.h>
#include <p24fj1024gb610.h>

#include "bsp/adc.h"
#include "bsp/lcd.h"
#include "bsp/timer_1ms.h"
#include "bsp/buttons.h"
#include "bsp/leds.h"
#include "bsp/rtcc.h"

#include "LIS3DH.h"
 
#include "io_mapping.h"

// *****************************************************************************
// *****************************************************************************
// Section: File Scope Variables and Functions
// *****************************************************************************
// *****************************************************************************
extern void SYS_Initialize ( void ) ;
static void BlinkAliveEventHandler( void );
static void ScreenUpdateEventHandler( void );

static RTCC_DATETIME time;
static RTCC_DATETIME lastTime = {0};
static volatile bool toggleBlinkAlive = false;
static volatile bool allowScreenUpdate = true;

// ****************************** I2C module *********************************************

//---------------------------------Variables------------------------------------
unsigned char slv_SAD = 0x30;   //Slave address (SAD + Write)(0b00110000(30h)) 
                                //Slave address (SAD + Read) (0b00110001(31h))
unsigned char slv_SUB = 0x0F;   //Register WHO_AM_I (0Fh) (00110011))

// *****************************************************************************

//--------------Function Purpose: Configure I2C module--------------------------
void I2C_init()
{
	LATAbits.LATA14 = 1;		//Start with bus in idle mode - both lines high
	LATAbits.LATA15 = 1;

	ODCAbits.ODCA14 = 1;		//Open drain mode
	ODCAbits.ODCA15 = 1;

	TRISAbits.TRISA14 = 0;      //SCL1 output (module PIN 57 RA14)
	TRISAbits.TRISA15 = 0;      //SDA1 output (module PIN 56 RA15)
    
	//Set up I2C for 400KHz operation on I2C port 1 (pins 56,57) on module PIC24FJ1024GB610
	//I2C1BRG = 18;	            //I2C1BRG = (Fcy/(Fscl*2)-2) = (16E6/(400E3*2)-2) = 18 (Fscl=400KHz)
    I2C1BRG = 78;
	//I2C1CONLbits.DISSLW = 0;	//Enable slew rate control for 400KHz operation
    I2C1CONLbits.DISSLW = 1;
	I2C1CONLbits.I2CEN = 1;     //Enable I2C
}

//------------------------------------------------------------------------------
void delay(unsigned int nMilliseconds)
{
  #define CYCLES_PER_MS         25 /* Number of decrement-and-test cycles. */

  unsigned long nCycles = nMilliseconds * CYCLES_PER_MS;
  while (nCycles--);
}

//---------------Function Purpose: I2C_Start sends start bit sequence-----------
void Start(void)
{   
    I2C1CONLbits.SEN = 1;		// Send start bit
    while(!IFS1bits.MI2C1IF);	// Wait for it to complete
    IFS1bits.MI2C1IF = 0;		// Clear the flag bit
}

//---------------Function Purpose: I2C_ReStart sends start bit sequence---------
void ReStart(void)
{
  I2C1CONLbits.RSEN = 1;			// Send Restart bit
  while(!IFS1bits.MI2C1IF);		// Wait for it to complete
  IFS1bits.MI2C1IF = 0;			// Clear the flag bit
}

//---------------Function : I2C_Stop sends stop bit sequence--------------------
void Stop(void)
{
  I2C1CONLbits.PEN = 1;             // Send stop bit
  while(!IFS1bits.MI2C1IF);         // Wait for it to complete
  IFS1bits.MI2C1IF = 0;             // Clear the flag bit
}

//---------------Function : I2C_Send_ACK sends ACK bit sequence-----------------
void ACK(void)
{
  I2C1CONLbits.ACKDT = 0;			// 0 means ACK
  I2C1CONLbits.ACKEN = 1;			// Send ACKDT value
  while(!IFS1bits.MI2C1IF);		// Wait for it to complete
  IFS1bits.MI2C1IF = 0;			// Clear the flag bit
}

//---------------Function : I2C_Send_NACK sends NACK bit sequence---------------
void NACK(void)
{
  I2C1CONLbits.ACKDT = 1;			// 1 means NACK
  I2C1CONLbits.ACKEN = 1;			// Send ACKDT value
  while(!IFS1bits.MI2C1IF);		// Wait for it to complete
  IFS1bits.MI2C1IF = 0;			// Clear the flag bit
}

//---------------Function Purpose: I2C_Write_Byte transfers one byte------------
void I2C_TX(unsigned char Byte)
{
  //unsigned char _byte;
  I2C1TRN = Byte;                   // Send Byte value
//  while(!IFS1bits.MI2C1IF);         // Wait for it to complete
  while(I2C1STATbits.TRSTAT);
  IFS1bits.MI2C1IF = 0;             // Clear the flag bit

  //return I2C1STATbits.ACKSTAT;      // Return ACK/NACK from slave
}

//----------------Function Purpose: I2C_Read_Byte reads one byte----------------
unsigned char I2C_RX(void)
{
   I2C1CONLbits.RCEN = 1;			// Enable reception of 8 bits
   while(!IFS1bits.MI2C1IF);		// Wait for it to complete
   IFS1bits.MI2C1IF = 0;			// Clear the flag bit

   return I2C1RCV;                  // Return received byte
}

//------------------------------------------------------------------------------
void I2C_Wait()
{
    while ( (I2C1CONL & 0x001F) || (I2C1STAT & 0x0004) )
    {
        /*Do nothing*/
    };
}

//------------------------------------------------------------------------------
void device_write(int slave_addr , int send_data)
{  
  Start();
//  I2C_Wait();
  I2C_TX(slave_addr);
  I2C_TX(send_data);
  Stop();
}

//------------------------------------------------------------------------------
uint8_t device_read()
//unsigned char device_read(unsigned char Byte)
{
  const int read = 1;
  uint8_t result;
  
  Start();
  I2C_Wait();
  I2C_TX(slv_SAD + read);       // 7 bit device addr + control bit( 1 = read )
  result = I2C_RX();
//  LATA = I2C_RX();
  NACK();                           //Give NACK to stop reading
  Stop();
  
  TRISA = 0;
  return result;
}

uint8_t device_read_register(uint8_t slave_addr, uint8_t reg_addr){
    uint8_t rcv;
    ReStart();
//    I2C_Wait();
    I2C_TX(slave_addr);
    I2C_TX(reg_addr);
//    Start();
    rcv = device_read();
    
    LATA = rcv;
    
    return rcv;
    
    
}

void device_write_register(uint8_t slave_addr, uint8_t reg_addr, uint8_t data){
    Start();
    I2C_Wait();
    I2C_TX(slave_addr);
    I2C_TX(reg_addr);
    I2C_TX(data);
    Stop();
}

void LIS3DH_Setup(){
     
    device_write_register(slv_SAD, REG_CTRL_REG1, (0b0010 << 4) | 0b111);
    device_write_register(slv_SAD, REG_CTRL_REG2, 0x00);
//    device_write_register(slv_SAD, REG_CTRL_REG5, (1 << 6));
}

// *****************************************************************************
// Section: Main Entry Point
// *****************************************************************************
// *****************************************************************************
int main (void){ 
//    
    SYS_Initialize ( );
    TIMER_SetConfiguration ( TIMER_CONFIGURATION_1MS );
    TIMER_RequestTick( &BlinkAliveEventHandler, 500 );
    TIMER_RequestTick( &ScreenUpdateEventHandler, 170 );
    
    time.bcdFormat = false;
    lastTime.bcdFormat = false;
    RTCC_BuildTimeGet( &time );
    RTCC_Initialize( &time );
    memset(&lastTime,0,sizeof(lastTime)); 
    
    printf( "\f" );
    printf( "Test");
    uint8_t result;
    I2C_init();
    uint16_t axis;
    int axis_s;

    LIS3DH_Setup();
    while(1){
        axis = device_read_register(slv_SAD, REG_OUT_X_L);
        delay(1);
        result = device_read_register(slv_SAD, REG_OUT_X_H);
        axis |= (result << 8);
        axis_s = (int)axis;
        
        printf("%d", axis_s);
        delay(500);
        printf("\f");

    }
        
//    device_read_register(slv_SAD , slv_SUB);
    
  
//  ReStart();
//  
//  device_write(slv_SAD , slv_SUB);
//  
//  device_read();
//  delay(1000);
//  
//****************************TEST**********************************************
/*    LED_D = [   3  , 4   , 5   , 6   , 7   , 8   , 9   , 10  ]
     PLED_D = [  17  , 38  , 58  , 59  , 60  , 61  , 91  , 92  ]
      PORTA = [  RA0 , RA1 , RA2 , RA3 , RA4 , RA5 , RA6 , RA7 ]  */
//******************************************************************************  
  
  while(1)
  {

  }
  
  //***********PRUEBA***************************************************
   //Envio de la dirección del esclavo y recepción del acknoledge
   /* device_write(slv_addr);
      delay(1000);
      //LED D1 -> PORTA Pin 0
      TRISAbits.TRISA0 = 0;
      LATAbits.LATA0 = I2C1STATbits.ACKSTAT;*/
  //********************************************************************

    /* Clear the screen */
   
  
  //******************************
  //TRISAbits.TRISA0 = 0;
  //LATAbits.LATA0 = I2C1STATbits.ACKSTAT;
  //******************************
  //TRISAbits.TRISA1 = 0;
  //LATAbits.LATA1 = I2C1STATbits.ACKSTAT;
  
}


static void BlinkAliveEventHandler(void)
{    
    toggleBlinkAlive = true;
}

static void ScreenUpdateEventHandler(void)
{
    allowScreenUpdate = true;
}
