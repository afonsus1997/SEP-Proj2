
#include "xc.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#include "periph/spi.h"
#include "periph/mcu.h"
#include "periph/gpio.h"
#include "periph/core_timer.h"
#include "periph/periph_conf.h"
#include "periph/timer1.h"
#include "periph/timer.h"
#include "periph/watchdog.h"
#include "periph/uart.h"
#include "periph/rtcc.h"

#include "drivers/sdcard.h"
#include "drivers/sdcard_cache.h"
#include "drivers/mbr.h"
#include "drivers/lcd.h"

#include "libs/fat16/fat16.h"

#include "utils.h"
#include "explorer1632.h"

#include "LIS3DH.h"

#define ACCVALUETIME 5000
#define ORIENTATIONTIME 5000
#define DISPLAYREFRESHRATE 400

#define SCK_PIN               GPIO_PIN(PORT_G, 6)
#define MISO_PIN              GPIO_PIN(PORT_G, 7)
#define MOSI_PIN              GPIO_PIN(PORT_G, 8)
#define SD_CS_PIN             GPIO_PIN(PORT_G, 9)

static struct storage_dev_t dev = {
    sdcard_cache_read,
    sdcard_cache_read_byte,
    sdcard_cache_write,
    sdcard_cache_seek
};

struct sdcard_spi_dev_t sdcard_dev;


//void mcu_idle(void)
//{
//    __asm__ __volatile__ ("pwrsav #1");
//}
//
//void mcu_sleep(void)
//{
//    __asm__ __volatile__ ("pwrsav #0");
//}

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

static void printAcc(void){
    axis_t axis;
    printf("\f");
    readAxis(slv_SAD, &axis);
    printf("X=%.2f  Y=%.2f\nZ=%.2f", axis.x, axis.y, axis.z);
}

long firstTick = 0;


int main(void) {
    mcu_set_system_clock(30000000LU);
    watchdog_disable();
    configureIoC();
    timer1_power_up();
    timer1_configure(TIMER1_PRESCALER_1, 14565, 1);
    timer1_start();
    
    RTCC_Initialize();
    
    LCD_Initialize();
    
    gpio_init_out(MOSI_PIN, 0);
    gpio_init_in(MISO_PIN);
    gpio_init_out(SCK_PIN, 0);
    RPOR9bits.RP19R = 0x000a;       /* SPI1 - MOSI */
    RPINR22bits.SDI2R = 0x001a;     /* SPI1 - MISO */
    RPOR10bits.RP21R = 0x000b;        /* SPI1 - SCK */
    gpio_init_out(SD_CS_PIN, 1);
    spi_power_up(SPI_2);
    spi_configure(SPI_2, 400000, SPI_MODE_0);
    spi_enable(SPI_2);
    
    
    LIS3DH_Setup();
    while(1){
        LIS3DH_Clear_Interrupt();
        firstTick = core_timer_get_ticks();
        while(1){
            if((core_timer_get_ticks() - firstTick) > ACCVALUETIME)
                break;
            else{
                printAcc();
                mcu_delay(DISPLAYREFRESHRATE);

            }
        }

//        firstTick = core_timer_get_ticks();
//        while(1){
//            if((core_timer_get_ticks() - firstTick) > ORIENTATIONTIME)
//                break;
//            else{
//                printf( "\f" );
//                printf( "Orientation:\n" );
//                printf( "Up" );
//                mcu_delay(DISPLAYREFRESHRATE);
//
//            }
//        }
//
        printf( "\f" );
        printf( "Sleeping..." );
        mcu_sleep();
    }
    
    
}