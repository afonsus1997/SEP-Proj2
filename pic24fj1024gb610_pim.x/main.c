/*******************************************************************************
Copyright 2016 Microchip Technology Inc. (www.microchip.com)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*******************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <stdbool.h>
#include <string.h>
//#include <p24FJ1024GB610.h>
#include <xc.h>




#include "bsp/adc.h"
#include "bsp/lcd.h"
#include "bsp/timer_1ms.h"
#include "bsp/buttons.h"
#include "bsp/leds.h"
#include "bsp/rtcc.h"
 
#include "io_mapping.h"

// *****************************************************************************
// *****************************************************************************
// Section: File Scope Variables and Functions
// *****************************************************************************
// *****************************************************************************
extern void SYS_Initialize() ;
static void BlinkAliveEventHandler();
static void ScreenUpdateEventHandler();

static RTCC_DATETIME time;
static RTCC_DATETIME lastTime = {0};
static volatile bool toggleBlinkAlive = false;
static volatile bool allowScreenUpdate = true;

#define MEMCMP_VALUES_IDENTICAL 0


//================I2C==========================
uint16_t I2Cflags;

#define I2C_M_ACK	0
#define I2C_M_NACK	1

#define SetI2C1BusDirty	I2Cflags |=  0x0001
#define ClrI2C1BusDirty	I2Cflags &= ~0x0001
#define IsI2C1BusDirty	I2Cflags & 0x0001

void initI2C(void){
    //P56 SDA I2C1 RA14
    //P57 SCL I2C1 RA15
    
    LATAbits.LATA14 = 1;										//Start with bus in idle mode - both lines high
	LATAbits.LATA15 = 1;
	ODCAbits.ODCA15 = 1;
    ODCAbits.ODCA14 = 1;										//Open drain mode
//Open drain mode
	TRISAbits.TRISA15 = 0;									//SCL1 output
	TRISAbits.TRISA14 = 0;									//SDA1 output
    
    
	//I2C1CON = 0x1000;										//Set all bits to known state
	I2C1CON1bits.I2CEN = 0;									//Disable until everything set up. Pins will be std IO.
    I2C1BRG = 37;	
	I2C1CON1bits.DISSLW = 0;									//Enable slew rate control for 400kHz operation
	IFS1bits.MI2C1IF = 0;									//Clear I2C master int flag
	I2C1CON1bits.I2CEN = 1;									//Enable I2C

}

int I2C1_M_BusReset()
{
	int i;

	//Start with lines high - sets SCL high if not already there
	LATAbits.LATA14 = 1;										//PORTGbits.RG2 = 1 is equivalent
	LATAbits.LATA15 = 1;

//	Delay10us(1);											//Need 5uS delay
	if(PORTAbits.RA14 == 0)									//Read if line actually went high
	{
		return 1;											//SCL stuck low - is the pullup resistor loaded?
	}
	//SCL ok, toggle until SDA goes high.
	i=10;
	while(i>0)
	{
		if(PORTAbits.RA14 == 1)								//If SDA is high, then we are done
		{
			break;
		}
		LATAbits.LATA15 = 0;									//SCL low
/*		Delay10us(1);		*/								
		LATAbits.LATA15 = 1;									//SCL high
//		Delay10us(1);										//Need 5uS delay
		i--;
	}
	if((PORTG & 0x000C) != 0x000C)							//We are ok if SCL and SDA high
	{
		return 2;
	}

	LATAbits.LATA15 = 0;										//SDA LOW while SCL HIGH -> START
//	Delay10us(1);											//Need 5uS delay
	LATAbits.LATA15 = 1;										//SDA HIGH while SCL HIGH -> STOP
//	Delay10us(1);											//Need 5uS delay
	return 0;
}


void I2C1_M_ClearErrors()
{
	I2C1CON1bits.RCEN = 0;									//Cancel receive request
	I2C1STATbits.IWCOL = 0;									//Clear write-collision flag
	I2C1STATbits.BCL = 0;									//Clear bus-collision flag
}

int I2C1_M_RecoverBus()
{
	int status;
//	//Level 1: reset the I2C hardware on our side
//	I2C1CONbits.I2CEN = 0;
//	Nop();
//	I2C1CONbits.I2CEN = 1;

	//Level 2: reset devices on I2C network
	//Disable I2C so we can toggle pins
	I2C1CON1bits.I2CEN = 0;
	status = I2C1_M_BusReset();
	if(status>0)
	{//Fatal I2C error, nothing we can do about it
		return 0xFFFF;
	}
	//That worked, bring I2C back online
	I2C1CON1bits.I2CEN = 1;

	return 0;
}

int I2C1_M_ReStart()
{
	int t;

	I2C1CON1bits.RSEN = 1;									//Initiate restart condition
	Nop();
	if(I2C1STATbits.BCL)
	{
		return 0x8002;										//Will need to clear BCL!
	}

	t=0;//Timeout is processor speed dependent.  @(4*8Mhz=32Mhz;16MIPS), I expect <=40.
	while(I2C1CON1bits.RSEN)									//HW cleared when complete
	{
		t++;
		if(t>1000)
		{
			return 0x8001;
		}
	}//Tested: t=5
	return 0;
}

int I2C1_M_SendByte(char cData)
{
	int t;

	if(I2C1STATbits.TBF)									//Is there already a byte waiting to send?
	{
		return 0x8001;
	}
	I2C1TRN = cData;										//Send byte
	//Transmission takes several clock cycles to complete.  As a result we won't see BCL error for a while.
	t=0;//Timeout is processor speed dependent.  @(4*8Mhz=32Mhz;16MIPS) and 8 bits, I expect <=320.
	while(I2C1STATbits.TRSTAT)								//HW cleared when TX complete
	{
		t++;
		if(t>8000)
		{//This is bad because TRSTAT will still be set
			return 0x8002;
		}
	}//Testing: t=31

	if(I2C1STATbits.BCL)
	{
		I2C1STATbits.BCL = 0;								//Clear error to regain control of I2C
		return 0x8003;
	}

	//Done, now how did slave respond?
	if(I2C1STATbits.ACKSTAT)								//1=NACK
		return 1;											//  NACK
	else
		return 0;											//  ACK
}

int I2C1_M_Start()
{
	int t;

	I2C1CON1bits.SEN = 1;									//Initiate Start condition
	Nop();
	if(I2C1STATbits.BCL)
	{
		I2C1CON1bits.SEN = 0;								//Cancel request (will still be set if we had previous BCL)
		I2C1STATbits.BCL = 0;								//Clear error to regain control of I2C
		return 0x8002;
	}
	if(I2C1STATbits.IWCOL)
	{//Not sure how this happens but it occurred once, so trap here
		I2C1CON1bits.SEN = 0;								//Clear just in case set
		I2C1STATbits.IWCOL = 0;								//Clear error
		return 0x8003;
	}

	t=0;//Timeout is processor speed dependent.  @(4*8Mhz=32Mhz;16MIPS), I expect <=40.
	while(I2C1CON1bits.SEN)									//HW cleared when complete
	{
		t++;
		if(t>1000)
		{
			return 0x8001;
		}
	}//Tested: t=3.  I2C1STATbits.S will be set indicating start bit detected.

	//If a second start request is issued after first one, the I2C module will instead:
	//generate a stop request, clear SEN, and flag BCL.  Test for BCL here.
	if(I2C1STATbits.BCL)
	{
		I2C1STATbits.BCL = 0;								//Clear error to regain control of I2C
		return 0x8002;
	}

	return 0;
}

int I2C1_M_Stop()
{
	int t;

	I2C1CON1bits.PEN = 1;									//Initiate stop condition
	Nop();
	if(I2C1STATbits.BCL)
	{
		return 0x8002;											//Will need to clear BCL!
	}

	t=0;//Timeout is processor speed dependent.  @(4*8Mhz=16MIPS), I expect <=40.
	while(I2C1CON1bits.PEN)									//HW cleared when complete
	{
		t++;
		if(t>1000)
		{
			return 0x8001;
		}
	}//Tested: t=5
	return 0;
}

int  I2C1_M_Poll(uint8_t DevAddr)
{
	int retval;
	uint8_t SlaveAddr;

	SlaveAddr = (DevAddr << 1) | 0;

	if(IsI2C1BusDirty)
	{
		I2C1_M_ClearErrors();
		if(I2C1_M_RecoverBus()==0)
		{//Recovered
			ClrI2C1BusDirty;
		}
		else
		{
			return 0x8002;
		}
	}

	if(I2C1_M_Start() == 0)
	{
		retval = I2C1_M_SendByte((char)SlaveAddr);
		if(I2C1_M_Stop() == 0)								//Even if we have an error sending, try to close I2C
		{
			if(retval == 0)
			{
				return 0;
			}
		}
	}
	//Get here then we had an error
	SetI2C1BusDirty;										//Set error flag
	return 0x8001;
}

void I2C1_M_Write(uint8_t DevAddr, uint8_t SubAddr, int ByteCnt, char *buffer)
{
	int i;
	uint8_t SlaveAddr;

	if(IsI2C1BusDirty)										//Ignore requests until Poll cmd is called to fix err.
		return;

	SlaveAddr = (DevAddr << 1) | 0;							//Device Address + Write bit

	if(I2C1_M_Start() != 0)									//Start
	{//Failed to open bus
		SetI2C1BusDirty;
		return;
	}

	if( I2C1_M_SendByte((char)SlaveAddr) != 0)				//Slave Addr
	{
		I2C1_M_Stop();
		SetI2C1BusDirty;
		return;
	}

	if( I2C1_M_SendByte((char)SubAddr) != 0)				//Sub Addr
	{
		I2C1_M_Stop();
		SetI2C1BusDirty;
		return;
	}

	for(i=0;i<ByteCnt;i++)									//Data
	{
		if( I2C1_M_SendByte(buffer[i]) != 0)
		{//Error while writing byte.  Close connection and set error flag.
			I2C1_M_Stop();
			SetI2C1BusDirty;
			return;
		}
	}

	if(I2C1_M_Stop() != 0)
	{//Failed to close bus
		SetI2C1BusDirty;
		return;
	}
	return;
}

//=====================END i2C=====================

// *****************************************************************************
// *****************************************************************************
// Section: Main Entry Point
// *****************************************************************************
// *****************************************************************************
int main ( void )
{
    uint16_t adcResult;
    uint16_t lastAdcResult = 0xFFFF;
    
    /* Call the System Initialize routine*/
    SYS_Initialize ( );
    
    /* To determine how the LED and Buttons are mapped to the actual board
     * features, please see io_mapping.h. */
    LED_Enable ( LED_BLINK_ALIVE );
    LED_Enable ( LED_BUTTON_PRESSED );

    BUTTON_Enable ( BUTTON_DEMO );
    
    /* Get a timer event once every 100ms for the blink alive. */
    TIMER_SetConfiguration ( TIMER_CONFIGURATION_1MS );
    TIMER_RequestTick( &BlinkAliveEventHandler, 500 );
    TIMER_RequestTick( &ScreenUpdateEventHandler, 170 );
    
    /* The TIMER_1MS configuration should come before the RTCC initialization as
     * there are some processor modules that require the TIMER_1MS module to be
     * configured before the RTCC module, as the RTCC module is emulated using
     * the TIMER_1MS module. */
    time.bcdFormat = false;
    lastTime.bcdFormat = false;
    RTCC_BuildTimeGet( &time );
    RTCC_Initialize( &time );
    memset(&lastTime,0,sizeof(lastTime)); 

    ADC_SetConfiguration ( ADC_CONFIGURATION_DEFAULT );
    ADC_ChannelEnable ( ADC_CHANNEL_POTENTIOMETER );
    
            
            
    /* Clear the screen */
    printf( "\f" );   
    
    while ( 1 )
    {
        adcResult = ADC_Read10bit( ADC_CHANNEL_POTENTIOMETER );

        RTCC_TimeGet( &time );
        
        //Only print if the ADC value or time has changed since the last time 
        // around the loop and we haven't updated recently too recently.
        if(allowScreenUpdate == true)
        {
            if( (adcResult != lastAdcResult) ||
                (memcmp(&time, &lastTime, sizeof(time)) != MEMCMP_VALUES_IDENTICAL) )
            {                  
                //Either ADC or time has changed, and the screen update refresh
                // limit has expired, update the screen.
                allowScreenUpdate = false;
                
                printf( "Time %02d:%02d:%02d   Pot = %4d\r\n", 
                        time.hour, 
                        time.minute, 
                        time.second, 
                        adcResult
                      );

                lastAdcResult = adcResult;
                memcpy(&lastTime, &time, sizeof(time));
            }
        }

        if(toggleBlinkAlive == true)
        {
            LED_Toggle( LED_BLINK_ALIVE );
            toggleBlinkAlive = false;
        }
        
        /* To determine how the LED and Buttons are mapped to the actual board
         * features, please see io_mapping.h. */
        if(BUTTON_IsPressed( BUTTON_DEMO ) == true)
        {
            LED_On( LED_BUTTON_PRESSED );
        }
        else
        {
            LED_Off( LED_BUTTON_PRESSED );
        }
    }
}

static void BlinkAliveEventHandler(void)
{    
    toggleBlinkAlive = true;
}

static void ScreenUpdateEventHandler(void)
{
    allowScreenUpdate = true;
}

