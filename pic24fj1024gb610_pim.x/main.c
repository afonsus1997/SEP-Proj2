#include "main.h"
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
    
    time.bcdFormat = false;
    lastTime.bcdFormat = false;
    RTCC_BuildTimeGet( &time );
    RTCC_Initialize( &time );
    memset(&lastTime,0,sizeof(lastTime)); 
    
    printf( "\f" );
    printf( "Test");
    
    
    axis_t axis;
    
    LIS3DH_Setup();
    while(1){
        readAxis(slv_SAD, &axis);       
        printf("%d     %d\n     %d", axis.x, axis.y, axis.z);
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
