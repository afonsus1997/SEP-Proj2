/* 
 * File:   main.h
 * Author: Afonso Muralha
 *
 * Created on December 3, 2020, 11:09 AM
 */

#ifndef MAIN_H
#define	MAIN_H

#ifdef	__cplusplus
extern "C" {
#endif


#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <stdbool.h>
#include <string.h>
#include <p24fj1024gb610.h>

#include "bsp/adc.h"
#include "bsp/lcd.h"
#include "bsp/timer_1ms.h"
#include "bsp/buttons.h"
#include "bsp/leds.h"
#include "bsp/rtcc.h"

#include "LIS3DH.h"
 
#include "io_mapping.h"


#ifdef	__cplusplus
}
#endif

#endif	/* MAIN_H */

