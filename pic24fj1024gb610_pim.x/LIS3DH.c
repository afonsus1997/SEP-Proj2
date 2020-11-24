
#include "LIS3DH.h"

void INITsensor(){
    //start up by reading register REG_WHO_AM_I

}

/*
 bool LIS3DHI2C::readData(uint8_t addr, uint8_t *buf, size_t numBytes) {

	wire.beginTransmission(getI2CAddr());


	if (numBytes > 1) {

		addr |= I2C_INCREMENT;

	}

	wire.write(addr);


	uint8_t res = wire.endTransmission();

	if (res != 0) {

		return false;

	}


	wire.requestFrom(getI2CAddr(), numBytes);

	for(size_t ii = 0; ii < numBytes && wire.available(); ii++) {

		buf[ii] = wire.read();

	}

	return true;

}


bool LIS3DHI2C::writeData(uint8_t addr, const uint8_t *buf, size_t numBytes) {


	wire.beginTransmission(getI2CAddr());


	if (numBytes > 1) {

		addr |= I2C_INCREMENT;

	}

	wire.write(addr);

	for(size_t ii = 0; ii < numBytes; ii++) {

		wire.write(buf[ii]);

	}


	uint8_t res = wire.endTransmission();


	return (res == 0);

}
 * 
 * bool LIS3DH::setup(LIS3DHConfig &config) {

	if (!hasDevice()) {
		Serial.println("device not found");
		return false;
	}

	writeRegister8(REG_CTRL_REG1, config.reg1);
	writeRegister8(REG_CTRL_REG2, config.reg2);
	writeRegister8(REG_CTRL_REG3, config.reg3);
	writeRegister8(REG_CTRL_REG4, config.reg4);
	writeRegister8(REG_CTRL_REG5, config.reg5);
	writeRegister8(REG_CTRL_REG6, config.reg6);

	if (config.setReference) {
		// In normal mode, reading the reference register sets it for the current normal force
		// (the normal force of gravity acting on the device)
		readRegister8(REG_REFERENCE);
	}
	// Set FIFO mode
	writeRegister8(REG_FIFO_CTRL_REG, config.fifoCtrlReg);



	if ((config.reg3 & CTRL_REG3_I1_INT1) != 0) {

		writeRegister8(REG_INT1_THS, config.int1_ths);
		writeRegister8(REG_INT1_DURATION, config.int1_duration);

		if (intPin >= 0) {
			// There are instructions to set the INT1_CFG in a loop in the appnote on page 24. As far
			// as I can tell this never works. Merely setting the INT1_CFG does not ever generate an
			// interrupt for me.

			// Remember the INT1_CFG setting because we're apparently supposed to set it again after
			// clearing an interrupt.
			int1_cfg = config.int1_cfg;
			writeRegister8(REG_INT1_CFG, int1_cfg);

			// Clear the interrupt just in case
			readRegister8(REG_INT1_SRC);
		}
		else {
			int1_cfg = 0;
			writeRegister8(REG_INT1_CFG, 0);
		}
	}




	return true;
}

 */