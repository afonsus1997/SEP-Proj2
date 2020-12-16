/* 
 * File:   LIS3DH.h
 * Author: Afonso Muralha
 *
 * Created on November 24, 2020, 2:10 PM
 */

#ifndef LIS3DH_H
#define	LIS3DH_H

#include <stdlib.h>
#include <stddef.h>
#include <stdint.h>
#include <math.h>
//#include "i2c.h"

#ifdef	__cplusplus
extern "C" {
#endif




#ifdef	__cplusplus
}
#endif

#endif	/* LIS3DH_H */


typedef struct axis_s {
    float x;
    float y;
    float z;
    
} axis_t;

typedef struct axis_orientation_s {
    float pitch;
    float roll;
    float yaw;
    
} axis_orientation_t;

#define M_PI acos(-1.0)



#define slv_SAD 0x30   //Slave address (SAD + Write)(0b00110000(30h)) 
                                //Slave address (SAD + Read) (0b00110001(31h))
//unsigned char slv_SUB = 0x0F;   //Register WHO_AM_I (0Fh) (00110011))

#define I2C_ADDR 0b0011000

#define WHO_AM_I 0x0f

#define REG_STATUS_AUX 0x07

#define REG_OUT_ADC1_L 0x08

#define REG_OUT_ADC1_H 0x09

#define REG_OUT_ADC2_L 0x0a

#define REG_OUT_ADC2_H 0x0b

#define REG_OUT_ADC3_L 0x0c

#define REG_OUT_ADC3_H 0x0d

#define REG_INT_COUNTER_REG 0x0e

#define REG_WHO_AM_I 0x0f

#define REG_TEMP_CFG_REG 0x1f

#define REG_CTRL_REG1 0x20

#define REG_CTRL_REG2 0x21

#define REG_CTRL_REG3 0x22

#define REG_CTRL_REG4 0x23

#define REG_CTRL_REG5 0x24

#define REG_CTRL_REG6 0x25

#define REG_REFERENCE 0x26

#define REG_STATUS_REG 0x27

#define REG_OUT_X_L 0x28

#define REG_OUT_X_H 0x29

#define REG_OUT_Y_L 0x2a

#define REG_OUT_Y_H 0x2b

#define REG_OUT_Z_L 0x2c

#define REG_OUT_Z_H 0x2d

#define REG_FIFO_CTRL_REG 0x2e

#define REG_FIFO_SRC_REG 0x2f

#define REG_INT1_CFG 0x30

#define REG_INT1_SRC 0x31

#define REG_INT1_THS 0x32

#define REG_INT1_DURATION 0x33

#define REG_CLICK_CFG 0x38

#define REG_CLICK_SRC 0x39

#define REG_CLICK_THS 0x3a

#define REG_TIME_LIMIT 0x3b

#define REG_TIME_LATENCY 0x3c

#define REG_TIME_WINDOW 0x3d


#define STATUS_ZYXOR 0x80

#define STATUS_ZOR 0x40

#define STATUS_YOR 0x20

#define STATUS_XOR 0x10

#define STATUS_ZYXDA 0x08

#define STATUS_ZDA 0x04

#define STATUS_YDA 0x02

#define STATUS_XDA 0x01


#define STATUS_AUX_321OR 0x80

#define STATUS_AUX_3OR 0x40

#define STATUS_AUX_2OR 0x20

#define STATUS_AUX_1OR 0x10

#define STATUS_AUX_321DA 0x08

#define STATUS_AUX_3DA 0x04

#define STATUS_AUX_2DA 0x02

#define STATUS_AUX_1DA 0x01


#define CTRL_REG1_ODR3 0x80

#define CTRL_REG1_ODR2 0x40

#define CTRL_REG1_ODR1 0x20

#define CTRL_REG1_ODR0 0x10

#define CTRL_REG1_LPEN 0x08

#define CTRL_REG1_ZEN 0x04

#define CTRL_REG1_YEN 0x02

#define CTRL_REG1_XEN 0x01


#define RATE_1_HZ   0x10

#define RATE_10_HZ  0x20

#define RATE_25_HZ  0x30

#define RATE_50_HZ  0x40

#define RATE_100_HZ 0x50

#define RATE_200_HZ 0x60

#define RATE_400_HZ 0x70


#define CTRL_REG2_HPM1 0x80

#define CTRL_REG2_HPM0 0x40

#define CTRL_REG2_HPCF2 0x20

#define CTRL_REG2_HPCF1 0x10

#define CTRL_REG2_FDS 0x08

#define CTRL_REG2_HPCLICK 0x04

#define CTRL_REG2_HPIS2 0x02

#define CTRL_REG2_HPIS1 0x01



#define CTRL_REG3_I1_CLICK 0x80

#define CTRL_REG3_I1_INT1 0x40

#define CTRL_REG3_I1_DRDY 0x10

#define CTRL_REG3_I1_WTM 0x04

#define CTRL_REG3_I1_OVERRUN 0x02


#define CTRL_REG4_BDU 0x80

#define CTRL_REG4_BLE 0x40

#define CTRL_REG4_FS1 0x20

#define CTRL_REG4_FS0 0x10

#define CTRL_REG4_HR 0x08

#define CTRL_REG4_ST1 0x04

#define CTRL_REG4_ST0 0x02

#define CTRL_REG4_SIM 0x01



#define CTRL_REG5_BOOT 0x80

#define CTRL_REG5_FIFO_EN 0x40

#define CTRL_REG5_LIR_INT1 0x08

#define CTRL_REG5_D4D_INT1 0x04


#define CTRL_REG6_I2_CLICK 0x80

#define CTRL_REG6_I2_INT2 0x40

#define CTRL_REG6_BOOT_I2 0x10

#define CTRL_REG6_H_LACTIVE 0x02


#define INT1_CFG_AOI 0x80

#define INT1_CFG_6D 0x40

#define INT1_CFG_ZHIE_ZUPE 0x20

#define INT1_CFG_ZLIE_ZDOWNE 0x10

#define INT1_CFG_YHIE_YUPE 0x08

#define INT1_CFG_YLIE_YDOWNE 0x04

#define INT1_CFG_XHIE_XUPE 0x02

#define INT1_CFG_XLIE_XDOWNE 0x01


#define INT1_SRC_IA 0x40

#define INT1_SRC_ZH 0x20

#define INT1_SRC_ZL 0x10

#define INT1_SRC_YH 0x08

#define INT1_SRC_YL 0x04

#define INT1_SRC_XH 0x02

#define INT1_SRC_XL 0x01


#define TEMP_CFG_ADC_PD 0x80

#define TEMP_CFG_TEMP_EN 0x40


#define FIFO_CTRL_BYPASS 0x00

#define FIFO_CTRL_FIFO 0x40

#define FIFO_CTRL_STREAM 0x80

#define FIFO_CTRL_STREAM_TO_FIFO 0xc0


#define FIFO_SRC_WTM 0x80

#define FIFO_SRC_OVRN 0x40

#define FIFO_SRC_EMPTY 0x20

#define FIFO_SRC_FSS_MASK 0x1f

#define I2C_INCREMENT 0x80

static const unsigned long RECALIBRATION_MOVEMENT_DELAY = 100;


//INT AXIS INTERRUPT THRESHOLDS
#define INT_TSH_VALUE 0x10//64//64 //1sb=16mg, 64=1024mg