/* 
 * File:   i2c.h
 * Author: Afonso Muralha
 *
 * Created on November 24, 2020, 2:15 PM
 */

#ifndef I2C_H
#define	I2C_H

#ifdef	__cplusplus
extern "C" {
#endif

#include <stdio.h>
#include <stdlib.h>
#include <stddef.h>
#include <stdbool.h>
#include <xc.h>

uint16_t I2Cflags;

#define I2C_M_ACK	0
#define I2C_M_NACK	1

#define SetI2C1BusDirty	I2Cflags |=  0x0001
#define ClrI2C1BusDirty	I2Cflags &= ~0x0001
#define IsI2C1BusDirty	I2Cflags & 0x0001


#ifdef	__cplusplus
}
#endif

#endif	/* I2C_H */

