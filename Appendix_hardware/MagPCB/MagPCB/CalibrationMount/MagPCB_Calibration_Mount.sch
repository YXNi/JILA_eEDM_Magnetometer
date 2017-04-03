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
LIBS:MagPCB_Calibration_Mount-cache
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "29 jul 2015"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L BOLT_CONN_SINGLE_SUPP P1
U 1 1 55AD3B7B
P 1800 1900
F 0 "P1" H 1800 2200 50  0000 C CNN
F 1 "BOLT_CONN_SINGLE_SUPP" V 2050 1850 50  0000 C CNN
F 2 "~" H 1800 1900 60  0000 C CNN
F 3 "~" H 1800 1900 60  0000 C CNN
	1    1800 1900
	-1   0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 55B950A1
P 1900 2900
F 0 "R1" V 1980 2900 40  0000 C CNN
F 1 "Thermistor" V 1907 2901 40  0000 C CNN
F 2 "~" V 1830 2900 30  0000 C CNN
F 3 "~" H 1900 2900 30  0000 C CNN
	1    1900 2900
	0    -1   -1   0   
$EndComp
$Comp
L R R2
U 1 1 55B950AE
P 2550 2900
F 0 "R2" V 2630 2900 40  0000 C CNN
F 1 "30k" V 2557 2901 40  0000 C CNN
F 2 "~" V 2480 2900 30  0000 C CNN
F 3 "~" H 2550 2900 30  0000 C CNN
	1    2550 2900
	0    -1   -1   0   
$EndComp
Text GLabel 2000 1750 2    60   Input ~ 0
VDD
Text GLabel 4400 1750 0    60   Input ~ 0
VDD
Text GLabel 4400 1850 0    60   Input ~ 0
GND
Text GLabel 2000 1900 2    60   Input ~ 0
GND
Text GLabel 2000 2050 2    60   Input ~ 0
SCL
Text GLabel 4400 1950 0    60   Input ~ 0
SCL
Text GLabel 2000 2200 2    60   Input ~ 0
SDA
Text GLabel 4400 2050 0    60   Input ~ 0
SDA
Wire Wire Line
	2150 2900 2300 2900
Text GLabel 1650 2900 0    60   Input ~ 0
VDD
Text GLabel 2800 2900 2    60   Input ~ 0
GND
$Comp
L HOST_CONN HCONN1
U 1 1 55B95542
P 4650 1950
F 0 "HCONN1" H 4650 2400 60  0000 C CNN
F 1 "HOST_CONN" H 4650 2300 60  0000 C CNN
F 2 "" H 4650 1900 60  0000 C CNN
F 3 "" H 4650 1900 60  0000 C CNN
	1    4650 1950
	1    0    0    -1  
$EndComp
Text GLabel 4400 2150 0    60   Input ~ 0
AIN
Text GLabel 2250 2900 1    60   Input ~ 0
AIN
Connection ~ 2250 2900
$EndSCHEMATC
