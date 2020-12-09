
#include "LIS3DH.h"

void LIS3DH_Setup(){
    //high resolution mode/10hz
    I2C_init();
    device_write_register(slv_SAD, REG_CTRL_REG1, (0b0010 << 4) | 0b111);
    device_write_register(slv_SAD, REG_CTRL_REG2, 0x00);
//    device_write_register(slv_SAD, REG_CTRL_REG5, (1 << 6));
}

void LIS3DH_Interrupt_Setup(){
    //interrupt mode: OR, all axis
    device_write_register(slv_SAD, REG_INT1_CFG, 0b00111111);
    device_write_register(slv_SAD, REG_INT1_THS, INT_TSH_VALUE);
    device_write_register(slv_SAD, REG_CTRL_REG3, 0b01000000); //enable interrupts
}

void LIS3DH_Clear_Interrupt(){
    //used to clear the interrupt bit of the sensor
    device_read_register(slv_SAD, REG_INT1_SRC);
}

void readAxis(uint8_t slave_addr, axis_t * axis){
    uint8_t temp_h;
    uint8_t temp_l;
    temp_l = device_read_register(slave_addr, REG_OUT_X_L);
    delay(1);
    temp_h = device_read_register(slave_addr, REG_OUT_X_H);
//    axis->x =  (temp_l | (temp_h << 8)) >> 4;
    axis->x =  (float)(temp_l | (temp_h << 8))/15987;

    temp_l = device_read_register(slave_addr, REG_OUT_Y_L);
    delay(1);
    temp_h = device_read_register(slave_addr, REG_OUT_Y_H);
    axis->y =  (float)(temp_l | (temp_h << 8))/15987;
    
    temp_l = device_read_register(slave_addr, REG_OUT_Z_L);
    delay(1);
    temp_h = device_read_register(slave_addr, REG_OUT_Z_H);
    axis->z =  (float)(temp_l | (temp_h << 8))/15987;
    
    if(axis->x < 0.02 && axis->x > -0.02)
        axis->x = 0;
    if(axis->y < 0.02 && axis->y > -0.02)
        axis->y = 0;
    if(axis->z < 0.02 && axis->z > -0.02)
        axis->z = 0;
}
