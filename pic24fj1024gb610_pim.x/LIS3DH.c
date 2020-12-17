
#include "LIS3DH.h"

#define ACC_BETA 0.001

void LIS3DH_Setup(){
    //high resolution mode/10hz
    I2C_init();
    device_write_register(slv_SAD, REG_CTRL_REG1, (0b0010 << 4) | 0b111); //10hz
    device_write_register(slv_SAD, REG_CTRL_REG2, 0x00);
//    device_write_register(slv_SAD, REG_CTRL_REG5, (1 << 6));
    LIS3DH_Interrupt_Setup();
    device_read_register(slv_SAD, REG_INT1_SRC);
}

void LIS3DH_Interrupt_Setup(){
    //interrupt mode: OR, all axis
    device_write_register(slv_SAD, REG_INT1_CFG, 0b00000010); //0b00000011 - x+ 
    device_write_register(slv_SAD, REG_INT1_THS, INT_TSH_VALUE);
    device_write_register(slv_SAD, REG_INT1_DURATION, 0b00000000);
//    device_write_register(slv_SAD, REG_CTRL_REG5, 0b00001000); //enable latch interrupt     
    
    device_write_register(slv_SAD, REG_CTRL_REG3, 0b01000000); //enable interrupts
}

void LIS3DH_Clear_Interrupt(){
    //used to clear the interrupt bit of the sensor
    device_read_register(slv_SAD, REG_INT1_SRC);
}

float axisConversion(uint8_t byteMSB, uint8_t byteLSB){
    uint16_t value = ( (uint16_t)(byteMSB) << 8 ) | (uint16_t)byteLSB; //assemple bytes
    value >>= 6; //remove lsbs
    int16_t s_value = (int16_t)(value^(0x1<<(10-1))); //zero the sign bit
    s_value -= ((int16_t)(1)<<(10-1)); //subtract half of the range
    return (float)s_value*4/1000;
}

void calculateOrientation(axis_t * axis, axis_orientation_t * axis_ori){
    
    uint8_t sign = (axis->z < 0)  ? -1 : 1;
    //axis_ori->roll = (float)(atan2(axis->y, axis->z) * 180/M_PI);
    //this should be more precise but other method works too
    axis_ori->roll = (float)(atan2(axis->y, sign*sqrt(pow(axis->z, 2) + ACC_BETA*pow(axis->x, 2))) * 180/M_PI);
    axis_ori->pitch = (float)(atan2(-axis->x, sqrt(pow(axis->y, 2) + pow(axis->z, 2))) * 180/M_PI);
}

void readAxis(uint8_t slave_addr, axis_t * axis){
    uint8_t temp_h;
    uint8_t temp_l;
    temp_l = device_read_register(slave_addr, REG_OUT_X_L);
    delay(1);
    temp_h = device_read_register(slave_addr, REG_OUT_X_H);
    axis->x =  axisConversion(temp_h, temp_l);
//    axis->x =  (float)(temp_l | (temp_h << 8))/15987;

    temp_l = device_read_register(slave_addr, REG_OUT_Y_L);
    delay(1);
    temp_h = device_read_register(slave_addr, REG_OUT_Y_H);
    axis->y =  axisConversion(temp_h, temp_l);
//    axis->y =  (float)(temp_l | (temp_h << 8))/15987;
    
    temp_l = device_read_register(slave_addr, REG_OUT_Z_L);
    delay(1);
    temp_h = device_read_register(slave_addr, REG_OUT_Z_H);
    axis->z =  axisConversion(temp_h, temp_l);
//      axis->z =  (float)(temp_l | (temp_h << 8))/15987;
    
    
}
