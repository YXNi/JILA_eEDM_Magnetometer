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
LIBS:arduino_shield
LIBS:MagPCB_single_supply-cache
EELAYER 27 0
EELAYER END
$Descr User 5906 4724
encoding utf-8
Sheet 1 1
Title "Chip Mount Design Schematic"
Date "2 apr 2017"
Rev ""
Comp "JILA"
Comment1 "Yiqi X. Ni"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L HMC5883 MAG1
U 1 1 55A010BA
P 3450 1850
F 0 "MAG1" H 3450 2200 60  0000 C CNN
F 1 "HMC5883" H 3450 2300 60  0000 C CNN
F 2 "~" H 3450 1850 60  0000 C CNN
F 3 "~" H 3450 1850 60  0000 C CNN
	1    3450 1850
	1    0    0    -1  
$EndComp
$Comp
L BOLT_CONN_SINGLE_SUPP P1
U 1 1 55A013CB
P 1350 1800
F 0 "P1" H 1350 2100 50  0000 C CNN
F 1 "BOLT_CONN_SINGLE_SUPP" V 1600 1750 50  0000 C CNN
F 2 "~" H 1350 1800 60  0000 C CNN
F 3 "~" H 1350 1800 60  0000 C CNN
	1    1350 1800
	-1   0    0    -1  
$EndComp
Text GLabel 1550 1650 2    60   Input ~ 0
VDD
Text GLabel 1550 1800 2    60   Input ~ 0
GND
Text GLabel 1550 1950 2    60   Input ~ 0
SCL
Text GLabel 1550 2100 2    60   Input ~ 0
SDA
Text GLabel 2350 1700 0    60   Input ~ 0
VDD
Wire Wire Line
	2350 1700 2950 1700
Text GLabel 2350 1550 0    60   Input ~ 0
SCL
Wire Wire Line
	2350 1550 2950 1550
Wire Wire Line
	2950 1550 2950 1600
NoConn ~ 2950 1800
NoConn ~ 4000 1800
NoConn ~ 2950 2000
NoConn ~ 2950 2100
NoConn ~ 2950 2200
Text GLabel 4300 1600 2    60   Input ~ 0
SDA
Wire Wire Line
	4000 1600 4300 1600
NoConn ~ 4000 1700
Text GLabel 4300 2100 2    60   Input ~ 0
GND
Wire Wire Line
	4000 2100 4300 2100
Text GLabel 4300 2300 2    60   Input ~ 0
GND
Wire Wire Line
	4000 2300 4300 2300
Text GLabel 4300 1900 2    60   Input ~ 0
VDD
Wire Wire Line
	4000 1900 4300 1900
Wire Wire Line
	2800 1700 2800 1900
Wire Wire Line
	2800 1900 2950 1900
Connection ~ 2800 1700
Wire Wire Line
	2950 2300 2950 2450
Wire Wire Line
	4150 2450 4150 2000
Wire Wire Line
	4150 2000 4000 2000
$Comp
L C C2
U 1 1 55A01563
P 2600 1900
F 0 "C2" H 2600 2000 40  0000 L CNN
F 1 "0.1uF" H 2606 1815 40  0000 L CNN
F 2 "~" H 2638 1750 30  0000 C CNN
F 3 "~" H 2600 1900 60  0000 C CNN
	1    2600 1900
	1    0    0    -1  
$EndComp
Text GLabel 2600 2100 3    60   Input ~ 0
GND
$Comp
L C C1
U 1 1 55A015BE
P 4450 2650
F 0 "C1" H 4450 2750 40  0000 L CNN
F 1 "0.47uF" H 4456 2565 40  0000 L CNN
F 2 "~" H 4488 2500 30  0000 C CNN
F 3 "~" H 4450 2650 60  0000 C CNN
	1    4450 2650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4000 2200 4100 2200
Wire Wire Line
	4100 2200 4100 2650
Wire Wire Line
	4100 2650 4250 2650
Text GLabel 4650 2650 2    60   Input ~ 0
GND
Connection ~ 2600 1700
Connection ~ 4000 1900
Connection ~ 4000 2000
Connection ~ 2950 2300
$Comp
L C C3
U 1 1 55A0232E
P 3500 2650
F 0 "C3" H 3500 2750 40  0000 L CNN
F 1 "0.22uF" H 3506 2565 40  0000 L CNN
F 2 "~" H 3538 2500 30  0000 C CNN
F 3 "~" H 3500 2650 60  0000 C CNN
	1    3500 2650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3300 2450 3300 2650
Connection ~ 3300 2450
Wire Wire Line
	3700 2450 3700 2650
Connection ~ 3700 2450
Wire Wire Line
	2950 2450 3300 2450
Wire Wire Line
	3700 2450 4150 2450
$EndSCHEMATC
