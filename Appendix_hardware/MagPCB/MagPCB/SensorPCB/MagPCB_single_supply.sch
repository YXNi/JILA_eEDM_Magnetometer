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
LIBS:MagPCB_single_supply-cache
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date "5 aug 2015"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L HMC5883 MAG1
U 1 1 55A010BA
P 5800 3600
F 0 "MAG1" H 5800 3950 60  0000 C CNN
F 1 "HMC5883" H 5800 4050 60  0000 C CNN
F 2 "~" H 5800 3600 60  0000 C CNN
F 3 "~" H 5800 3600 60  0000 C CNN
	1    5800 3600
	1    0    0    -1  
$EndComp
$Comp
L BOLT_CONN_SINGLE_SUPP P1
U 1 1 55A013CB
P 2700 3400
F 0 "P1" H 2700 3700 50  0000 C CNN
F 1 "BOLT_CONN_SINGLE_SUPP" V 2950 3350 50  0000 C CNN
F 2 "~" H 2700 3400 60  0000 C CNN
F 3 "~" H 2700 3400 60  0000 C CNN
	1    2700 3400
	-1   0    0    -1  
$EndComp
Text GLabel 2900 3250 2    60   Input ~ 0
VDD
Text GLabel 2900 3400 2    60   Input ~ 0
GND
Text GLabel 2900 3550 2    60   Input ~ 0
SCL
Text GLabel 2900 3700 2    60   Input ~ 0
SDA
Text GLabel 4700 3450 0    60   Input ~ 0
VDD
Wire Wire Line
	4700 3450 5300 3450
Text GLabel 4700 3300 0    60   Input ~ 0
SCL
Wire Wire Line
	4700 3300 5300 3300
Wire Wire Line
	5300 3300 5300 3350
NoConn ~ 5300 3550
NoConn ~ 6350 3550
NoConn ~ 5300 3750
NoConn ~ 5300 3850
NoConn ~ 5300 3950
Text GLabel 6650 3350 2    60   Input ~ 0
SDA
Wire Wire Line
	6350 3350 6650 3350
NoConn ~ 6350 3450
Text GLabel 6650 3850 2    60   Input ~ 0
GND
Wire Wire Line
	6350 3850 6650 3850
Text GLabel 6650 4050 2    60   Input ~ 0
GND
Wire Wire Line
	6350 4050 6650 4050
Text GLabel 6650 3650 2    60   Input ~ 0
VDD
Wire Wire Line
	6350 3650 6650 3650
Wire Wire Line
	5150 3450 5150 3650
Wire Wire Line
	5150 3650 5300 3650
Connection ~ 5150 3450
Wire Wire Line
	5300 4050 5300 4200
Wire Wire Line
	6500 4200 6500 3750
Wire Wire Line
	6500 3750 6350 3750
$Comp
L C C2
U 1 1 55A01563
P 4950 3650
F 0 "C2" H 4950 3750 40  0000 L CNN
F 1 "0.1uF" H 4956 3565 40  0000 L CNN
F 2 "~" H 4988 3500 30  0000 C CNN
F 3 "~" H 4950 3650 60  0000 C CNN
	1    4950 3650
	1    0    0    -1  
$EndComp
Text GLabel 4950 3850 3    60   Input ~ 0
GND
$Comp
L C C1
U 1 1 55A015BE
P 6800 4400
F 0 "C1" H 6800 4500 40  0000 L CNN
F 1 "0.47uF" H 6806 4315 40  0000 L CNN
F 2 "~" H 6838 4250 30  0000 C CNN
F 3 "~" H 6800 4400 60  0000 C CNN
	1    6800 4400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6350 3950 6450 3950
Wire Wire Line
	6450 3950 6450 4400
Wire Wire Line
	6450 4400 6600 4400
Text GLabel 7000 4400 2    60   Input ~ 0
GND
Connection ~ 4950 3450
Connection ~ 6350 3650
Connection ~ 6350 3750
Connection ~ 5300 4050
$Comp
L C C3
U 1 1 55A0232E
P 5850 4400
F 0 "C3" H 5850 4500 40  0000 L CNN
F 1 "0.22uF" H 5856 4315 40  0000 L CNN
F 2 "~" H 5888 4250 30  0000 C CNN
F 3 "~" H 5850 4400 60  0000 C CNN
	1    5850 4400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5650 4200 5650 4400
Connection ~ 5650 4200
Wire Wire Line
	6050 4200 6050 4400
Connection ~ 6050 4200
Wire Wire Line
	5300 4200 5650 4200
Wire Wire Line
	6050 4200 6500 4200
$EndSCHEMATC
