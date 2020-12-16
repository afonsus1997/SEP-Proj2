#include "main.h"
// *****************************************************************************
// *****************************************************************************
// Section: File Scope Variables and Functions
// *****************************************************************************
// *****************************************************************************

#define ACCVALUETIME 10000
#define ORIENTATIONTIME 10000
#define DISPLAYREFRESHRATE 600

extern void SYS_Initialize ( void ) ;
extern void LIS3DH_Clear_Interrupt();
static void BlinkAliveEventHandler( void );
static void ScreenUpdateEventHandler( void );
uint16_t getCurrentVSysTick();
static void SysTickHandler (void);
static void printAcc(void);


static RTCC_DATETIME time;
static RTCC_DATETIME lastTime = {0};
static volatile bool toggleBlinkAlive = false;
static volatile bool allowScreenUpdate = true;
static volatile bool allowSysTick = true;
long sysTick = 0;


void mcu_idle(void)
{
    __asm__ __volatile__ ("pwrsav #1");
}

void mcu_sleep(void)
{
    __asm__ __volatile__ ("pwrsav #0");
}

void configureIoC () {
 // Button S4 -> PORTD Pin 13 =========== PIN RF2
 // Configure the Interrupt on Change (IoC) functionality for button S4
    PADCONbits.IOCON = 1;       // Step1, enables the IoC functionality
    TRISFbits.TRISF2 = 1;      // Step 2, sets the pin as digital inputs
    //ANSDbits.ANSD13 = 0;      // This should be used if the pin had any analog functionality
//    IOCPDbits.IOCPD13 = 0;      // Step 3, disables rising egde interrupt
    IOCPFbits.IOCPF2 = 1;      // enables RISING edge interrupt
//    IOCPUDbits.IOCPUD13 = 1;    // Step 4, enabling the internal pull-up resistor on the pin
//    IOCPDDbits.IOCPDD13 = 0;    // disabling the internal pull-down resistor
    IOCFFbits.IOCFF2 = 0;      // Step 5, clear individual flag for IoC
    IFS1bits.IOCIF = 0;         // clear overall interrupt flag for the IoC
    IPC4bits.IOCIP = 1;         // Step 6, configure the IoC priority to value 1
    IEC1bits.IOCIE = 1;         // Step 7, enable the IoC interrupt
}


// ****************************** I2C module *********************************************

//---------------------------------Variables------------------------------------


// *****************************************************************************

//--------------Function Purpose: Configure I2C module--------------------------


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
    TIMER_RequestTick( &SysTickHandler, 1);
    
    time.bcdFormat = false;
    lastTime.bcdFormat = false;
    RTCC_BuildTimeGet( &time );
    RTCC_Initialize( &time );
    memset(&lastTime,0,sizeof(lastTime)); 
    
    configureIoC();
    
    printf( "\f" );
    printf( "Test");
    
    uint16_t firstTick;
    LIS3DH_Setup();
    while(1){
        LIS3DH_Clear_Interrupt();
        firstTick = getCurrentVSysTick();
        while(1){
            if((getCurrentVSysTick() - firstTick) > ACCVALUETIME)
                break;
            else{
                printAcc();
                delay(DISPLAYREFRESHRATE);

            }
        }

        firstTick = getCurrentVSysTick();
        while(1){
            if((getCurrentVSysTick() - firstTick) > ORIENTATIONTIME)
                break;
            else{
                
                printOri();
                delay(DISPLAYREFRESHRATE);

            }
        }

        printf( "\f" );
        printf( "Sleeping..." );
        mcu_sleep();
    }
    
    
    
    
    
//****************************TEST**********************************************
/*    LED_D = [   3  , 4   , 5   , 6   , 7   , 8   , 9   , 10  ]
     PLED_D = [  17  , 38  , 58  , 59  , 60  , 61  , 91  , 92  ]
      PORTA = [  RA0 , RA1 , RA2 , RA3 , RA4 , RA5 , RA6 , RA7 ]  */
//******************************************************************************  
  
  
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

uint16_t getCurrentVSysTick(){
    return sysTick;
}

static void BlinkAliveEventHandler(void)
{    
    toggleBlinkAlive = true;
}

static void ScreenUpdateEventHandler(void)
{
    allowScreenUpdate = false;
}

static void SysTickHandler (void){
    sysTick++;
}

void printAcc(void){
    axis_t axis;
    printf("\f");
    readAxis(slv_SAD, &axis);
    if(axis.x < 0.02 && axis.x > -0.02)
        axis.x = 0;
    if(axis.y < 0.02 && axis.y > -0.02)
        axis.y = 0;
    if(axis.z < 0.02 && axis.z > -0.02)
        axis.z = 0;
    printf("X=%.2f  Y=%.2f\nZ=%.2f", axis.x, axis.y, axis.z);
}

void printOri(void){
    axis_t axis;
    axis_orientation_t axis_ori;
    readAxis(slv_SAD, &axis);
    calculateOrientation(&axis, &axis_ori);
    printf("\f");
    printf("Pitch=%.2f\nRoll=%.2f", axis_ori.pitch, axis_ori.roll);

    
}

void __attribute__((__interrupt__, auto_psv)) _IOCInterrupt( void )
{
    IFS1bits.IOCIF = 0;           // Clear overall interrupt flag for the IoC
    //Idle();
}