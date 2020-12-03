
#include "LIS3DH.h"



void LIS3DH_Setup(){
    I2C_init();
    device_write_register(slv_SAD, REG_CTRL_REG1, (0b0010 << 4) | 0b111);
    device_write_register(slv_SAD, REG_CTRL_REG2, 0x00);
//    device_write_register(slv_SAD, REG_CTRL_REG5, (1 << 6));
}

void readAxis(uint8_t slave_addr, axis_t * axis){
    uint8_t temp_h;
    uint8_t temp_l;
    temp_l = device_read_register(slave_addr, REG_OUT_X_L);
    delay(1);
    temp_h = device_read_register(slave_addr, REG_OUT_X_H);
    axis->x =  (temp_l | (temp_h << 8));
    
    temp_l = device_read_register(slave_addr, REG_OUT_Y_L);
    delay(1);
    temp_h = device_read_register(slave_addr, REG_OUT_Y_H);
    axis->y =  (temp_l | (temp_h << 8));
    
    temp_l = device_read_register(slave_addr, REG_OUT_Z_L);
    delay(1);
    temp_h = device_read_register(slave_addr, REG_OUT_Z_H);
    axis->z =  (temp_l | (temp_h << 8));
 
}