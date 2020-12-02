#include "i2c.h"


//================I2C==========================

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
