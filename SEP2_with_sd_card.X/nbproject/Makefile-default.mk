#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/SEP2_with_sd_card.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/SEP2_with_sd_card.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS
SUB_IMAGE_ADDRESS_COMMAND=--image-address $(SUB_IMAGE_ADDRESS)
else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=bsp/adc.c bsp/buttons.c bsp/leds.c bsp/timer_1ms.c drivers/lcd.c drivers/mbr.c drivers/sdcard.c drivers/sdcard_cache.c libs/fat16/fat16.c libs/fat16/fat16_priv.c libs/fat16/path.c libs/fat16/rootdir.c libs/fat16/subdir.c periph/core_timer.c periph/gpio.c periph/io.c periph/mcu.c periph/rtcc.c periph/spi.c periph/timer.c periph/timer1.c periph/uart.c periph/watchdog.c utils.c main.c LIS3DH.c i2c.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/bsp/adc.o ${OBJECTDIR}/bsp/buttons.o ${OBJECTDIR}/bsp/leds.o ${OBJECTDIR}/bsp/timer_1ms.o ${OBJECTDIR}/drivers/lcd.o ${OBJECTDIR}/drivers/mbr.o ${OBJECTDIR}/drivers/sdcard.o ${OBJECTDIR}/drivers/sdcard_cache.o ${OBJECTDIR}/libs/fat16/fat16.o ${OBJECTDIR}/libs/fat16/fat16_priv.o ${OBJECTDIR}/libs/fat16/path.o ${OBJECTDIR}/libs/fat16/rootdir.o ${OBJECTDIR}/libs/fat16/subdir.o ${OBJECTDIR}/periph/core_timer.o ${OBJECTDIR}/periph/gpio.o ${OBJECTDIR}/periph/io.o ${OBJECTDIR}/periph/mcu.o ${OBJECTDIR}/periph/rtcc.o ${OBJECTDIR}/periph/spi.o ${OBJECTDIR}/periph/timer.o ${OBJECTDIR}/periph/timer1.o ${OBJECTDIR}/periph/uart.o ${OBJECTDIR}/periph/watchdog.o ${OBJECTDIR}/utils.o ${OBJECTDIR}/main.o ${OBJECTDIR}/LIS3DH.o ${OBJECTDIR}/i2c.o
POSSIBLE_DEPFILES=${OBJECTDIR}/bsp/adc.o.d ${OBJECTDIR}/bsp/buttons.o.d ${OBJECTDIR}/bsp/leds.o.d ${OBJECTDIR}/bsp/timer_1ms.o.d ${OBJECTDIR}/drivers/lcd.o.d ${OBJECTDIR}/drivers/mbr.o.d ${OBJECTDIR}/drivers/sdcard.o.d ${OBJECTDIR}/drivers/sdcard_cache.o.d ${OBJECTDIR}/libs/fat16/fat16.o.d ${OBJECTDIR}/libs/fat16/fat16_priv.o.d ${OBJECTDIR}/libs/fat16/path.o.d ${OBJECTDIR}/libs/fat16/rootdir.o.d ${OBJECTDIR}/libs/fat16/subdir.o.d ${OBJECTDIR}/periph/core_timer.o.d ${OBJECTDIR}/periph/gpio.o.d ${OBJECTDIR}/periph/io.o.d ${OBJECTDIR}/periph/mcu.o.d ${OBJECTDIR}/periph/rtcc.o.d ${OBJECTDIR}/periph/spi.o.d ${OBJECTDIR}/periph/timer.o.d ${OBJECTDIR}/periph/timer1.o.d ${OBJECTDIR}/periph/uart.o.d ${OBJECTDIR}/periph/watchdog.o.d ${OBJECTDIR}/utils.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/LIS3DH.o.d ${OBJECTDIR}/i2c.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/bsp/adc.o ${OBJECTDIR}/bsp/buttons.o ${OBJECTDIR}/bsp/leds.o ${OBJECTDIR}/bsp/timer_1ms.o ${OBJECTDIR}/drivers/lcd.o ${OBJECTDIR}/drivers/mbr.o ${OBJECTDIR}/drivers/sdcard.o ${OBJECTDIR}/drivers/sdcard_cache.o ${OBJECTDIR}/libs/fat16/fat16.o ${OBJECTDIR}/libs/fat16/fat16_priv.o ${OBJECTDIR}/libs/fat16/path.o ${OBJECTDIR}/libs/fat16/rootdir.o ${OBJECTDIR}/libs/fat16/subdir.o ${OBJECTDIR}/periph/core_timer.o ${OBJECTDIR}/periph/gpio.o ${OBJECTDIR}/periph/io.o ${OBJECTDIR}/periph/mcu.o ${OBJECTDIR}/periph/rtcc.o ${OBJECTDIR}/periph/spi.o ${OBJECTDIR}/periph/timer.o ${OBJECTDIR}/periph/timer1.o ${OBJECTDIR}/periph/uart.o ${OBJECTDIR}/periph/watchdog.o ${OBJECTDIR}/utils.o ${OBJECTDIR}/main.o ${OBJECTDIR}/LIS3DH.o ${OBJECTDIR}/i2c.o

# Source Files
SOURCEFILES=bsp/adc.c bsp/buttons.c bsp/leds.c bsp/timer_1ms.c drivers/lcd.c drivers/mbr.c drivers/sdcard.c drivers/sdcard_cache.c libs/fat16/fat16.c libs/fat16/fat16_priv.c libs/fat16/path.c libs/fat16/rootdir.c libs/fat16/subdir.c periph/core_timer.c periph/gpio.c periph/io.c periph/mcu.c periph/rtcc.c periph/spi.c periph/timer.c periph/timer1.c periph/uart.c periph/watchdog.c utils.c main.c LIS3DH.c i2c.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/SEP2_with_sd_card.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ1024GB610
MP_LINKER_FILE_OPTION=,--script=p24FJ1024GB610.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/bsp/adc.o: bsp/adc.c  .generated_files/145c21af8c867fcb9256c49c76e42f00bc58baeb.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/adc.o.d 
	@${RM} ${OBJECTDIR}/bsp/adc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/adc.c  -o ${OBJECTDIR}/bsp/adc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/adc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/buttons.o: bsp/buttons.c  .generated_files/514f21524e2aa251071cf7a1a2c578fdba7037ac.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/buttons.o.d 
	@${RM} ${OBJECTDIR}/bsp/buttons.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/buttons.c  -o ${OBJECTDIR}/bsp/buttons.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/buttons.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/leds.o: bsp/leds.c  .generated_files/729e81318d1da40d1d61108d1a0aa53ca462da6d.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/leds.o.d 
	@${RM} ${OBJECTDIR}/bsp/leds.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/leds.c  -o ${OBJECTDIR}/bsp/leds.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/leds.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/timer_1ms.o: bsp/timer_1ms.c  .generated_files/9cb6f2faa319122787ea86f5ee897534d9ebf26.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/timer_1ms.o.d 
	@${RM} ${OBJECTDIR}/bsp/timer_1ms.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/timer_1ms.c  -o ${OBJECTDIR}/bsp/timer_1ms.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/timer_1ms.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/drivers/lcd.o: drivers/lcd.c  .generated_files/63226aadc2e72299e2eac61db51aff3da815b5cc.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/drivers" 
	@${RM} ${OBJECTDIR}/drivers/lcd.o.d 
	@${RM} ${OBJECTDIR}/drivers/lcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  drivers/lcd.c  -o ${OBJECTDIR}/drivers/lcd.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/drivers/lcd.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/drivers/mbr.o: drivers/mbr.c  .generated_files/76f8101998673073c8950c964d62c5879fc3331.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/drivers" 
	@${RM} ${OBJECTDIR}/drivers/mbr.o.d 
	@${RM} ${OBJECTDIR}/drivers/mbr.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  drivers/mbr.c  -o ${OBJECTDIR}/drivers/mbr.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/drivers/mbr.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/drivers/sdcard.o: drivers/sdcard.c  .generated_files/b15de9fa8ee03b00ed174a43f612abf52a0eefa8.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/drivers" 
	@${RM} ${OBJECTDIR}/drivers/sdcard.o.d 
	@${RM} ${OBJECTDIR}/drivers/sdcard.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  drivers/sdcard.c  -o ${OBJECTDIR}/drivers/sdcard.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/drivers/sdcard.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/drivers/sdcard_cache.o: drivers/sdcard_cache.c  .generated_files/3a4eaa38a6983379d1d4375cd8c8729002bd7cda.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/drivers" 
	@${RM} ${OBJECTDIR}/drivers/sdcard_cache.o.d 
	@${RM} ${OBJECTDIR}/drivers/sdcard_cache.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  drivers/sdcard_cache.c  -o ${OBJECTDIR}/drivers/sdcard_cache.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/drivers/sdcard_cache.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/libs/fat16/fat16.o: libs/fat16/fat16.c  .generated_files/69a87540d7b5b73b337ab3fecb174772fdf69ce.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/libs/fat16" 
	@${RM} ${OBJECTDIR}/libs/fat16/fat16.o.d 
	@${RM} ${OBJECTDIR}/libs/fat16/fat16.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  libs/fat16/fat16.c  -o ${OBJECTDIR}/libs/fat16/fat16.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/libs/fat16/fat16.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/libs/fat16/fat16_priv.o: libs/fat16/fat16_priv.c  .generated_files/ded6e770ca2693d9de63d2ffb9b21091687f3af0.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/libs/fat16" 
	@${RM} ${OBJECTDIR}/libs/fat16/fat16_priv.o.d 
	@${RM} ${OBJECTDIR}/libs/fat16/fat16_priv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  libs/fat16/fat16_priv.c  -o ${OBJECTDIR}/libs/fat16/fat16_priv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/libs/fat16/fat16_priv.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/libs/fat16/path.o: libs/fat16/path.c  .generated_files/fd072baa8afbfc732284dcc9fb15297f40a49a04.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/libs/fat16" 
	@${RM} ${OBJECTDIR}/libs/fat16/path.o.d 
	@${RM} ${OBJECTDIR}/libs/fat16/path.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  libs/fat16/path.c  -o ${OBJECTDIR}/libs/fat16/path.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/libs/fat16/path.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/libs/fat16/rootdir.o: libs/fat16/rootdir.c  .generated_files/2a94493242b5ceb43311417ba1bbd88dc91dace0.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/libs/fat16" 
	@${RM} ${OBJECTDIR}/libs/fat16/rootdir.o.d 
	@${RM} ${OBJECTDIR}/libs/fat16/rootdir.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  libs/fat16/rootdir.c  -o ${OBJECTDIR}/libs/fat16/rootdir.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/libs/fat16/rootdir.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/libs/fat16/subdir.o: libs/fat16/subdir.c  .generated_files/f51cbb42244c53334faa5e21cbd6e189d5dd5a8d.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/libs/fat16" 
	@${RM} ${OBJECTDIR}/libs/fat16/subdir.o.d 
	@${RM} ${OBJECTDIR}/libs/fat16/subdir.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  libs/fat16/subdir.c  -o ${OBJECTDIR}/libs/fat16/subdir.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/libs/fat16/subdir.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/periph/core_timer.o: periph/core_timer.c  .generated_files/c1ded7667d8aef7277c301cf79c93754f21342d4.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/periph" 
	@${RM} ${OBJECTDIR}/periph/core_timer.o.d 
	@${RM} ${OBJECTDIR}/periph/core_timer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  periph/core_timer.c  -o ${OBJECTDIR}/periph/core_timer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/periph/core_timer.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/periph/gpio.o: periph/gpio.c  .generated_files/5211d08a5fe9258e92ac22a32816a307c81fe99e.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/periph" 
	@${RM} ${OBJECTDIR}/periph/gpio.o.d 
	@${RM} ${OBJECTDIR}/periph/gpio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  periph/gpio.c  -o ${OBJECTDIR}/periph/gpio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/periph/gpio.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/periph/io.o: periph/io.c  .generated_files/7ad088b3bb99d9d580f2c3b3a320c8445837764e.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/periph" 
	@${RM} ${OBJECTDIR}/periph/io.o.d 
	@${RM} ${OBJECTDIR}/periph/io.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  periph/io.c  -o ${OBJECTDIR}/periph/io.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/periph/io.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/periph/mcu.o: periph/mcu.c  .generated_files/6af0d76e4a39047aa2bd0279a0e48eb8e8391320.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/periph" 
	@${RM} ${OBJECTDIR}/periph/mcu.o.d 
	@${RM} ${OBJECTDIR}/periph/mcu.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  periph/mcu.c  -o ${OBJECTDIR}/periph/mcu.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/periph/mcu.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/periph/rtcc.o: periph/rtcc.c  .generated_files/6bc69673ba5c3381a7b72972dcb8c9800e45cce6.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/periph" 
	@${RM} ${OBJECTDIR}/periph/rtcc.o.d 
	@${RM} ${OBJECTDIR}/periph/rtcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  periph/rtcc.c  -o ${OBJECTDIR}/periph/rtcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/periph/rtcc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/periph/spi.o: periph/spi.c  .generated_files/e6e9fdae675cdf8b32774eaf1c240814cbf79d54.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/periph" 
	@${RM} ${OBJECTDIR}/periph/spi.o.d 
	@${RM} ${OBJECTDIR}/periph/spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  periph/spi.c  -o ${OBJECTDIR}/periph/spi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/periph/spi.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/periph/timer.o: periph/timer.c  .generated_files/33a4550eb52e5c44ad8db1fafab769d1e129bd94.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/periph" 
	@${RM} ${OBJECTDIR}/periph/timer.o.d 
	@${RM} ${OBJECTDIR}/periph/timer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  periph/timer.c  -o ${OBJECTDIR}/periph/timer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/periph/timer.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/periph/timer1.o: periph/timer1.c  .generated_files/6e2205b0cf3da3a1c4b96624c8358ef2329290fd.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/periph" 
	@${RM} ${OBJECTDIR}/periph/timer1.o.d 
	@${RM} ${OBJECTDIR}/periph/timer1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  periph/timer1.c  -o ${OBJECTDIR}/periph/timer1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/periph/timer1.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/periph/uart.o: periph/uart.c  .generated_files/31e7c20d5fe98db5a6f5d11905e5bf8f77750eb8.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/periph" 
	@${RM} ${OBJECTDIR}/periph/uart.o.d 
	@${RM} ${OBJECTDIR}/periph/uart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  periph/uart.c  -o ${OBJECTDIR}/periph/uart.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/periph/uart.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/periph/watchdog.o: periph/watchdog.c  .generated_files/5cf8993f8f707a6f7474cdf4da03b1ccd292bceb.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/periph" 
	@${RM} ${OBJECTDIR}/periph/watchdog.o.d 
	@${RM} ${OBJECTDIR}/periph/watchdog.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  periph/watchdog.c  -o ${OBJECTDIR}/periph/watchdog.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/periph/watchdog.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/utils.o: utils.c  .generated_files/f2623d7993342269dbb3493ef11ee6df65035fd2.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/utils.o.d 
	@${RM} ${OBJECTDIR}/utils.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  utils.c  -o ${OBJECTDIR}/utils.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/utils.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/afbe7749fa1e40cf5607baa9c37f57d5e922cc2f.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/LIS3DH.o: LIS3DH.c  .generated_files/69c838cf1b8c0891276c535be7c7c06c30715f91.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LIS3DH.o.d 
	@${RM} ${OBJECTDIR}/LIS3DH.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  LIS3DH.c  -o ${OBJECTDIR}/LIS3DH.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/LIS3DH.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/i2c.o: i2c.c  .generated_files/e72325b90e1dd245563cd71b697fbccbaad38a4d.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/i2c.o.d 
	@${RM} ${OBJECTDIR}/i2c.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  i2c.c  -o ${OBJECTDIR}/i2c.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/i2c.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/bsp/adc.o: bsp/adc.c  .generated_files/d9fb06bead40a475e7ce62022da16438a50687f2.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/adc.o.d 
	@${RM} ${OBJECTDIR}/bsp/adc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/adc.c  -o ${OBJECTDIR}/bsp/adc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/adc.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/buttons.o: bsp/buttons.c  .generated_files/d29ee0037cb4bdf133dc115a843e56712acc858c.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/buttons.o.d 
	@${RM} ${OBJECTDIR}/bsp/buttons.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/buttons.c  -o ${OBJECTDIR}/bsp/buttons.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/buttons.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/leds.o: bsp/leds.c  .generated_files/f7deb95d2f7592d2552a0df2d2ae082b4101d6b7.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/leds.o.d 
	@${RM} ${OBJECTDIR}/bsp/leds.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/leds.c  -o ${OBJECTDIR}/bsp/leds.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/leds.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/timer_1ms.o: bsp/timer_1ms.c  .generated_files/369ad95da05e41154120a4518d845a31ccca63ee.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/timer_1ms.o.d 
	@${RM} ${OBJECTDIR}/bsp/timer_1ms.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/timer_1ms.c  -o ${OBJECTDIR}/bsp/timer_1ms.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/timer_1ms.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/drivers/lcd.o: drivers/lcd.c  .generated_files/ac08ef00ea5d19bd51563b6dd86aab8d7c15039a.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/drivers" 
	@${RM} ${OBJECTDIR}/drivers/lcd.o.d 
	@${RM} ${OBJECTDIR}/drivers/lcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  drivers/lcd.c  -o ${OBJECTDIR}/drivers/lcd.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/drivers/lcd.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/drivers/mbr.o: drivers/mbr.c  .generated_files/1ca9154c0105092ce6140c34c4ecff0f13668de.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/drivers" 
	@${RM} ${OBJECTDIR}/drivers/mbr.o.d 
	@${RM} ${OBJECTDIR}/drivers/mbr.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  drivers/mbr.c  -o ${OBJECTDIR}/drivers/mbr.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/drivers/mbr.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/drivers/sdcard.o: drivers/sdcard.c  .generated_files/c562d12930c69541164f69e4adaa2d620a0e6f40.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/drivers" 
	@${RM} ${OBJECTDIR}/drivers/sdcard.o.d 
	@${RM} ${OBJECTDIR}/drivers/sdcard.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  drivers/sdcard.c  -o ${OBJECTDIR}/drivers/sdcard.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/drivers/sdcard.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/drivers/sdcard_cache.o: drivers/sdcard_cache.c  .generated_files/57680eae35acad5cfcf30b79f418c4a51d70f6e.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/drivers" 
	@${RM} ${OBJECTDIR}/drivers/sdcard_cache.o.d 
	@${RM} ${OBJECTDIR}/drivers/sdcard_cache.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  drivers/sdcard_cache.c  -o ${OBJECTDIR}/drivers/sdcard_cache.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/drivers/sdcard_cache.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/libs/fat16/fat16.o: libs/fat16/fat16.c  .generated_files/348f9e85b2fd052ef23675391cbf4bf111eae4ca.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/libs/fat16" 
	@${RM} ${OBJECTDIR}/libs/fat16/fat16.o.d 
	@${RM} ${OBJECTDIR}/libs/fat16/fat16.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  libs/fat16/fat16.c  -o ${OBJECTDIR}/libs/fat16/fat16.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/libs/fat16/fat16.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/libs/fat16/fat16_priv.o: libs/fat16/fat16_priv.c  .generated_files/ce9eb8f1f45968af5728a82331e28c64392239be.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/libs/fat16" 
	@${RM} ${OBJECTDIR}/libs/fat16/fat16_priv.o.d 
	@${RM} ${OBJECTDIR}/libs/fat16/fat16_priv.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  libs/fat16/fat16_priv.c  -o ${OBJECTDIR}/libs/fat16/fat16_priv.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/libs/fat16/fat16_priv.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/libs/fat16/path.o: libs/fat16/path.c  .generated_files/2f86deffb0dd8b7b57487992045f11e9b3f16a90.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/libs/fat16" 
	@${RM} ${OBJECTDIR}/libs/fat16/path.o.d 
	@${RM} ${OBJECTDIR}/libs/fat16/path.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  libs/fat16/path.c  -o ${OBJECTDIR}/libs/fat16/path.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/libs/fat16/path.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/libs/fat16/rootdir.o: libs/fat16/rootdir.c  .generated_files/62292b1b272f442415bb9fc5276c6c05439f0d7c.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/libs/fat16" 
	@${RM} ${OBJECTDIR}/libs/fat16/rootdir.o.d 
	@${RM} ${OBJECTDIR}/libs/fat16/rootdir.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  libs/fat16/rootdir.c  -o ${OBJECTDIR}/libs/fat16/rootdir.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/libs/fat16/rootdir.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/libs/fat16/subdir.o: libs/fat16/subdir.c  .generated_files/52a895b410939e114e58a25f6ca34aac409a29c1.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/libs/fat16" 
	@${RM} ${OBJECTDIR}/libs/fat16/subdir.o.d 
	@${RM} ${OBJECTDIR}/libs/fat16/subdir.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  libs/fat16/subdir.c  -o ${OBJECTDIR}/libs/fat16/subdir.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/libs/fat16/subdir.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/periph/core_timer.o: periph/core_timer.c  .generated_files/77197e99697578abb0f40eef816790bb7865c43a.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/periph" 
	@${RM} ${OBJECTDIR}/periph/core_timer.o.d 
	@${RM} ${OBJECTDIR}/periph/core_timer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  periph/core_timer.c  -o ${OBJECTDIR}/periph/core_timer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/periph/core_timer.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/periph/gpio.o: periph/gpio.c  .generated_files/7b80936d9cda791a07d56977a0eaf75da3bb58fe.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/periph" 
	@${RM} ${OBJECTDIR}/periph/gpio.o.d 
	@${RM} ${OBJECTDIR}/periph/gpio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  periph/gpio.c  -o ${OBJECTDIR}/periph/gpio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/periph/gpio.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/periph/io.o: periph/io.c  .generated_files/68002299106b4331ab0e433a76a54fe32448ba8.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/periph" 
	@${RM} ${OBJECTDIR}/periph/io.o.d 
	@${RM} ${OBJECTDIR}/periph/io.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  periph/io.c  -o ${OBJECTDIR}/periph/io.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/periph/io.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/periph/mcu.o: periph/mcu.c  .generated_files/69340a7d0a586eb84f53f84dd58eb7d2b233cfa.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/periph" 
	@${RM} ${OBJECTDIR}/periph/mcu.o.d 
	@${RM} ${OBJECTDIR}/periph/mcu.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  periph/mcu.c  -o ${OBJECTDIR}/periph/mcu.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/periph/mcu.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/periph/rtcc.o: periph/rtcc.c  .generated_files/c8d677b8ca57df8778dc1e3806c5213d0cb36dfc.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/periph" 
	@${RM} ${OBJECTDIR}/periph/rtcc.o.d 
	@${RM} ${OBJECTDIR}/periph/rtcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  periph/rtcc.c  -o ${OBJECTDIR}/periph/rtcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/periph/rtcc.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/periph/spi.o: periph/spi.c  .generated_files/c71da0582e13ff4f78ac99cb3e6be879bcf85a04.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/periph" 
	@${RM} ${OBJECTDIR}/periph/spi.o.d 
	@${RM} ${OBJECTDIR}/periph/spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  periph/spi.c  -o ${OBJECTDIR}/periph/spi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/periph/spi.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/periph/timer.o: periph/timer.c  .generated_files/28c1077b11b1ba8f5cb4fca9f680554215130772.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/periph" 
	@${RM} ${OBJECTDIR}/periph/timer.o.d 
	@${RM} ${OBJECTDIR}/periph/timer.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  periph/timer.c  -o ${OBJECTDIR}/periph/timer.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/periph/timer.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/periph/timer1.o: periph/timer1.c  .generated_files/5fe6eec40725cc1dc79ce40a99e0bdd08674986c.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/periph" 
	@${RM} ${OBJECTDIR}/periph/timer1.o.d 
	@${RM} ${OBJECTDIR}/periph/timer1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  periph/timer1.c  -o ${OBJECTDIR}/periph/timer1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/periph/timer1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/periph/uart.o: periph/uart.c  .generated_files/cf404256e603c37197358c1871e8b83fe99972b.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/periph" 
	@${RM} ${OBJECTDIR}/periph/uart.o.d 
	@${RM} ${OBJECTDIR}/periph/uart.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  periph/uart.c  -o ${OBJECTDIR}/periph/uart.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/periph/uart.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/periph/watchdog.o: periph/watchdog.c  .generated_files/40ab12c89a34897755f8ca9833250048809f39cc.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/periph" 
	@${RM} ${OBJECTDIR}/periph/watchdog.o.d 
	@${RM} ${OBJECTDIR}/periph/watchdog.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  periph/watchdog.c  -o ${OBJECTDIR}/periph/watchdog.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/periph/watchdog.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/utils.o: utils.c  .generated_files/536a2938a5328ea53708c9024af557aeb4258af.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/utils.o.d 
	@${RM} ${OBJECTDIR}/utils.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  utils.c  -o ${OBJECTDIR}/utils.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/utils.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/621fd7c55977e740220af0d61047ee192291f15b.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/LIS3DH.o: LIS3DH.c  .generated_files/d81509207d9754c39c1778f9377c44bd45a42a37.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LIS3DH.o.d 
	@${RM} ${OBJECTDIR}/LIS3DH.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  LIS3DH.c  -o ${OBJECTDIR}/LIS3DH.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/LIS3DH.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/i2c.o: i2c.c  .generated_files/da8ded8b8accc393ade1c5d28b04e9eb5aa82db8.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/i2c.o.d 
	@${RM} ${OBJECTDIR}/i2c.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  i2c.c  -o ${OBJECTDIR}/i2c.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/i2c.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/SEP2_with_sd_card.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/SEP2_with_sd_card.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x800:0x81B -mreserve=data@0x81C:0x81D -mreserve=data@0x81E:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x827 -mreserve=data@0x82A:0x84F   -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/SEP2_with_sd_card.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/SEP2_with_sd_card.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/SEP2_with_sd_card.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
