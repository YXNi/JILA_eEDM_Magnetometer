EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:MagPCB_Library
LIBS:arduino_shieldsNCL
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "26 oct 2015"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L HMC5883 MAG1
U 1 1 562EAC1C
P 2300 2450
F 0 "MAG1" H 2300 2550 60  0000 C CNN
F 1 "HMC5883" H 2300 2650 60  0000 C CNN
F 2 "" H 2350 2450 60  0000 C CNN
F 3 "" H 2350 2450 60  0000 C CNN
	1    2300 2450
	1    0    0    -1  
$EndComp
$Comp
L HMC5883 MAG3
U 1 1 562EAC29
P 4500 2450
F 0 "MAG3" H 4500 2550 60  0000 C CNN
F 1 "HMC5883" H 4500 2650 60  0000 C CNN
F 2 "" H 4550 2450 60  0000 C CNN
F 3 "" H 4550 2450 60  0000 C CNN
	1    4500 2450
	1    0    0    -1  
$EndComp
$Comp
L HMC5883 MAG2
U 1 1 562EAC3B
P 3400 2450
F 0 "MAG2" H 3400 2550 60  0000 C CNN
F 1 "HMC5883" H 3400 2650 60  0000 C CNN
F 2 "" H 3450 2450 60  0000 C CNN
F 3 "" H 3450 2450 60  0000 C CNN
	1    3400 2450
	1    0    0    -1  
$EndComp
$Comp
L HMC5883 MAG4
U 1 1 562EAC41
P 5500 2450
F 0 "MAG4" H 5500 2550 60  0000 C CNN
F 1 "HMC5883" H 5500 2650 60  0000 C CNN
F 2 "" H 5550 2450 60  0000 C CNN
F 3 "" H 5550 2450 60  0000 C CNN
	1    5500 2450
	1    0    0    -1  
$EndComp
$Comp
L VG_CONN VG_conn1
U 1 1 562EB5C6
P 7150 2650
F 0 "VG_conn1" H 7150 3050 60  0000 C CNN
F 1 "VG_CONN" H 7150 3150 60  0000 C CNN
F 2 "" H 7350 2650 60  0000 C CNN
F 3 "" H 7350 2650 60  0000 C CNN
	1    7150 2650
	1    0    0    -1  
$EndComp
Text GLabel 2150 2900 3    60   Input ~ 0
VDD
Text GLabel 3250 2900 3    60   Input ~ 0
VDD
Text GLabel 4350 2900 3    60   Input ~ 0
VDD
Text GLabel 5350 2900 3    60   Input ~ 0
VDD
Text GLabel 6700 2950 3    60   Input ~ 0
VDD
Text GLabel 2250 2900 3    60   Input ~ 0
GND
Text GLabel 3350 2900 3    60   Input ~ 0
GND
Text GLabel 4450 2900 3    60   Input ~ 0
GND
Text GLabel 5450 2900 3    60   Input ~ 0
GND
Text GLabel 6850 2950 3    60   Input ~ 0
GND
Text GLabel 2350 2900 3    60   Input ~ 0
SCL
Text GLabel 3450 2900 3    60   Input ~ 0
SCL
Text GLabel 4550 2900 3    60   Input ~ 0
SCL
Text GLabel 5550 2900 3    60   Input ~ 0
SCL
Text GLabel 7000 2950 3    60   Input ~ 0
SCL
Text GLabel 2450 2900 3    60   Input ~ 0
SDA1
Text GLabel 3550 2900 3    60   Input ~ 0
SDA2
Text GLabel 4650 2900 3    60   Input ~ 0
SDA3
Text GLabel 5650 2900 3    60   Input ~ 0
SDA4
Text GLabel 7150 2950 3    60   Input ~ 0
SDA1
Text GLabel 7300 2950 3    60   Input ~ 0
SDA2
Text GLabel 7450 2950 3    60   Input ~ 0
SDA3
Text GLabel 7600 2950 3    60   Input ~ 0
SDA4
$EndSCHEMATC
