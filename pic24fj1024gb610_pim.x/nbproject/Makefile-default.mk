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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/pic24fj1024gb610_pim.x.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/pic24fj1024gb610_pim.x.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
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
SOURCEFILES_QUOTED_IF_SPACED=bsp/adc.c bsp/rtcc.c bsp/buttons.c bsp/lcd.c bsp/leds.c bsp/lcd_printf.c bsp/timer_1ms.c main.c system.c LIS3DH.c i2c.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/bsp/adc.o ${OBJECTDIR}/bsp/rtcc.o ${OBJECTDIR}/bsp/buttons.o ${OBJECTDIR}/bsp/lcd.o ${OBJECTDIR}/bsp/leds.o ${OBJECTDIR}/bsp/lcd_printf.o ${OBJECTDIR}/bsp/timer_1ms.o ${OBJECTDIR}/main.o ${OBJECTDIR}/system.o ${OBJECTDIR}/LIS3DH.o ${OBJECTDIR}/i2c.o
POSSIBLE_DEPFILES=${OBJECTDIR}/bsp/adc.o.d ${OBJECTDIR}/bsp/rtcc.o.d ${OBJECTDIR}/bsp/buttons.o.d ${OBJECTDIR}/bsp/lcd.o.d ${OBJECTDIR}/bsp/leds.o.d ${OBJECTDIR}/bsp/lcd_printf.o.d ${OBJECTDIR}/bsp/timer_1ms.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/system.o.d ${OBJECTDIR}/LIS3DH.o.d ${OBJECTDIR}/i2c.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/bsp/adc.o ${OBJECTDIR}/bsp/rtcc.o ${OBJECTDIR}/bsp/buttons.o ${OBJECTDIR}/bsp/lcd.o ${OBJECTDIR}/bsp/leds.o ${OBJECTDIR}/bsp/lcd_printf.o ${OBJECTDIR}/bsp/timer_1ms.o ${OBJECTDIR}/main.o ${OBJECTDIR}/system.o ${OBJECTDIR}/LIS3DH.o ${OBJECTDIR}/i2c.o

# Source Files
SOURCEFILES=bsp/adc.c bsp/rtcc.c bsp/buttons.c bsp/lcd.c bsp/leds.c bsp/lcd_printf.c bsp/timer_1ms.c main.c system.c LIS3DH.c i2c.c



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
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/pic24fj1024gb610_pim.x.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ1024GB610
MP_LINKER_FILE_OPTION=,--script=p24FJ1024GB610.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/bsp/adc.o: bsp/adc.c  .generated_files/458a52902216a07e0cd009632c25636c73f18b05.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/adc.o.d 
	@${RM} ${OBJECTDIR}/bsp/adc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/adc.c  -o ${OBJECTDIR}/bsp/adc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/adc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/rtcc.o: bsp/rtcc.c  .generated_files/7515002d1eeb467a0b436d364c12225ef95d8f8c.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/rtcc.o.d 
	@${RM} ${OBJECTDIR}/bsp/rtcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/rtcc.c  -o ${OBJECTDIR}/bsp/rtcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/rtcc.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/buttons.o: bsp/buttons.c  .generated_files/1946e78016e92e583920a3712f8489f96f2f1f34.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/buttons.o.d 
	@${RM} ${OBJECTDIR}/bsp/buttons.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/buttons.c  -o ${OBJECTDIR}/bsp/buttons.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/buttons.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/lcd.o: bsp/lcd.c  .generated_files/1e91e8af6e263e9717d5de3d70f9d9c4852a6ff0.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/lcd.o.d 
	@${RM} ${OBJECTDIR}/bsp/lcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/lcd.c  -o ${OBJECTDIR}/bsp/lcd.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/lcd.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/leds.o: bsp/leds.c  .generated_files/32df6237f369949b3b925b70cf38472b4af974bb.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/leds.o.d 
	@${RM} ${OBJECTDIR}/bsp/leds.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/leds.c  -o ${OBJECTDIR}/bsp/leds.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/leds.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/lcd_printf.o: bsp/lcd_printf.c  .generated_files/1d4d83d04874535e047568516d3b2970cc24c475.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/lcd_printf.o.d 
	@${RM} ${OBJECTDIR}/bsp/lcd_printf.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/lcd_printf.c  -o ${OBJECTDIR}/bsp/lcd_printf.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/lcd_printf.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/timer_1ms.o: bsp/timer_1ms.c  .generated_files/2d07fd51e181e3d445318f2d68a8ec1544cac66e.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/timer_1ms.o.d 
	@${RM} ${OBJECTDIR}/bsp/timer_1ms.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/timer_1ms.c  -o ${OBJECTDIR}/bsp/timer_1ms.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/timer_1ms.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/2ef63add8d2fbfd939065eb8e3980dfcc5e6c459.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/system.o: system.c  .generated_files/38c5ab57738a0782727c95c1f415319ae159e238.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/system.o.d 
	@${RM} ${OBJECTDIR}/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  system.c  -o ${OBJECTDIR}/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/system.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/LIS3DH.o: LIS3DH.c  .generated_files/a1225754105dade21adb45e194bf003f081592d5.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LIS3DH.o.d 
	@${RM} ${OBJECTDIR}/LIS3DH.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  LIS3DH.c  -o ${OBJECTDIR}/LIS3DH.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/LIS3DH.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/i2c.o: i2c.c  .generated_files/6166bea2ac0ac74522d084c4cec988e5ed71bc46.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/i2c.o.d 
	@${RM} ${OBJECTDIR}/i2c.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  i2c.c  -o ${OBJECTDIR}/i2c.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/i2c.o.d"      -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/bsp/adc.o: bsp/adc.c  .generated_files/37cf725f233099afa48c4d7656b20924b4ced15e.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/adc.o.d 
	@${RM} ${OBJECTDIR}/bsp/adc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/adc.c  -o ${OBJECTDIR}/bsp/adc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/adc.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/rtcc.o: bsp/rtcc.c  .generated_files/69945f9bd897a79df602cf6de616e9cd2f9ea0ab.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/rtcc.o.d 
	@${RM} ${OBJECTDIR}/bsp/rtcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/rtcc.c  -o ${OBJECTDIR}/bsp/rtcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/rtcc.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/buttons.o: bsp/buttons.c  .generated_files/42645fb8dc63e3c4e3fc1f089e2c93a0dc58bd86.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/buttons.o.d 
	@${RM} ${OBJECTDIR}/bsp/buttons.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/buttons.c  -o ${OBJECTDIR}/bsp/buttons.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/buttons.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/lcd.o: bsp/lcd.c  .generated_files/a406f2621ae469404dfdb905f7bef55f2e46064b.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/lcd.o.d 
	@${RM} ${OBJECTDIR}/bsp/lcd.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/lcd.c  -o ${OBJECTDIR}/bsp/lcd.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/lcd.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/leds.o: bsp/leds.c  .generated_files/69a498191fd54ea1761fa53c1d53ce3f734e922.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/leds.o.d 
	@${RM} ${OBJECTDIR}/bsp/leds.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/leds.c  -o ${OBJECTDIR}/bsp/leds.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/leds.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/lcd_printf.o: bsp/lcd_printf.c  .generated_files/7848af67b6ae073157e186ead058484cb31163d5.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/lcd_printf.o.d 
	@${RM} ${OBJECTDIR}/bsp/lcd_printf.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/lcd_printf.c  -o ${OBJECTDIR}/bsp/lcd_printf.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/lcd_printf.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/bsp/timer_1ms.o: bsp/timer_1ms.c  .generated_files/9968975bdd112d4dc60a539dd6898abe41aaff1e.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}/bsp" 
	@${RM} ${OBJECTDIR}/bsp/timer_1ms.o.d 
	@${RM} ${OBJECTDIR}/bsp/timer_1ms.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  bsp/timer_1ms.c  -o ${OBJECTDIR}/bsp/timer_1ms.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/bsp/timer_1ms.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/4d6dfb070dec0e0a3891d86ada34e95d4fea57e7.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/system.o: system.c  .generated_files/fc0c18daebdc086400bfbb2ea3801e3d37d63e61.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/system.o.d 
	@${RM} ${OBJECTDIR}/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  system.c  -o ${OBJECTDIR}/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/system.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/LIS3DH.o: LIS3DH.c  .generated_files/8889163b60c82087a1b79d2bfa1b05bfe8d345a6.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/LIS3DH.o.d 
	@${RM} ${OBJECTDIR}/LIS3DH.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  LIS3DH.c  -o ${OBJECTDIR}/LIS3DH.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/LIS3DH.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/i2c.o: i2c.c  .generated_files/bfc89925cb2a18dd40f3971d088eb8310c2a6174.flag .generated_files/647cdef09a74fadadc5113b1ead3e23ada6a50f5.flag
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/i2c.o.d 
	@${RM} ${OBJECTDIR}/i2c.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  i2c.c  -o ${OBJECTDIR}/i2c.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/i2c.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
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
dist/${CND_CONF}/${IMAGE_TYPE}/pic24fj1024gb610_pim.x.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/pic24fj1024gb610_pim.x.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG -D__MPLAB_DEBUGGER_PK3=1  -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x800:0x81B -mreserve=data@0x81C:0x81D -mreserve=data@0x81E:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x827 -mreserve=data@0x82A:0x84F   -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,--defsym=__MPLAB_DEBUGGER_PK3=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--no-isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/pic24fj1024gb610_pim.x.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/pic24fj1024gb610_pim.x.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)  -no-legacy-libc  $(COMPARISON_BUILD)  -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--no-isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/pic24fj1024gb610_pim.x.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
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
