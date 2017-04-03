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
LIBS:MagPCBHOST_single_supply-cache
EELAYER 27 0
EELAYER END
$Descr User 7874 7087
encoding utf-8
Sheet 1 1
Title "Gradiometer Design Schematic"
Date "2 apr 2017"
Rev "1"
Comp "JILA"
Comment1 "Yiqi X. Ni"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L BOLT_CONN_SINGLE_SUPP P1
U 1 1 55A055FE
P 1300 1500
F 0 "P1" H 1300 1800 50  0000 C CNN
F 1 "BOLT_CONN_SINGLE_SUPP" V 1550 1450 50  0000 C CNN
F 2 "~" H 1300 1500 60  0000 C CNN
F 3 "~" H 1300 1500 60  0000 C CNN
	1    1300 1500
	-1   0    0    -1  
$EndComp
Text GLabel 1500 1350 2    60   Input ~ 0
VDD
Text GLabel 1500 1500 2    60   Input ~ 0
GND
Text GLabel 1500 1650 2    60   Input ~ 0
SCL
Text GLabel 1500 1800 2    60   Input ~ 0
SDA1
$Comp
L BOLT_CONN_SINGLE_SUPP P2
U 1 1 55A05644
P 1300 2500
F 0 "P2" H 1300 2800 50  0000 C CNN
F 1 "BOLT_CONN_SINGLE_SUPP" V 1550 2450 50  0000 C CNN
F 2 "~" H 1300 2500 60  0000 C CNN
F 3 "~" H 1300 2500 60  0000 C CNN
	1    1300 2500
	-1   0    0    -1  
$EndComp
Text GLabel 1500 2350 2    60   Input ~ 0
VDD
Text GLabel 1500 2500 2    60   Input ~ 0
GND
Text GLabel 1500 2650 2    60   Input ~ 0
SCL
Text GLabel 1500 2800 2    60   Input ~ 0
SDA2
$Comp
L BOLT_CONN_SINGLE_SUPP P5
U 1 1 55A05651
P 2900 1500
F 0 "P5" H 2900 1800 50  0000 C CNN
F 1 "BOLT_CONN_SINGLE_SUPP" V 3150 1450 50  0000 C CNN
F 2 "~" H 2900 1500 60  0000 C CNN
F 3 "~" H 2900 1500 60  0000 C CNN
	1    2900 1500
	-1   0    0    -1  
$EndComp
Text GLabel 3100 1350 2    60   Input ~ 0
VDD
Text GLabel 3100 1500 2    60   Input ~ 0
GND
Text GLabel 3100 1650 2    60   Input ~ 0
SCL
Text GLabel 3100 1800 2    60   Input ~ 0
SDA5
$Comp
L BOLT_CONN_SINGLE_SUPP P6
U 1 1 55A0565B
P 2900 2500
F 0 "P6" H 2900 2800 50  0000 C CNN
F 1 "BOLT_CONN_SINGLE_SUPP" V 3150 2450 50  0000 C CNN
F 2 "~" H 2900 2500 60  0000 C CNN
F 3 "~" H 2900 2500 60  0000 C CNN
	1    2900 2500
	-1   0    0    -1  
$EndComp
Text GLabel 3100 2350 2    60   Input ~ 0
VDD
Text GLabel 3100 2500 2    60   Input ~ 0
GND
Text GLabel 3100 2650 2    60   Input ~ 0
SCL
Text GLabel 3100 2800 2    60   Input ~ 0
SDA6
$Comp
L BOLT_CONN_SINGLE_SUPP P3
U 1 1 55A05665
P 1300 3550
F 0 "P3" H 1300 3850 50  0000 C CNN
F 1 "BOLT_CONN_SINGLE_SUPP" V 1550 3500 50  0000 C CNN
F 2 "~" H 1300 3550 60  0000 C CNN
F 3 "~" H 1300 3550 60  0000 C CNN
	1    1300 3550
	-1   0    0    -1  
$EndComp
Text GLabel 1500 3400 2    60   Input ~ 0
VDD
Text GLabel 1500 3550 2    60   Input ~ 0
GND
Text GLabel 1500 3700 2    60   Input ~ 0
SCL
Text GLabel 1500 3850 2    60   Input ~ 0
SDA3
$Comp
L BOLT_CONN_SINGLE_SUPP P4
U 1 1 55A0566F
P 1300 4550
F 0 "P4" H 1300 4850 50  0000 C CNN
F 1 "BOLT_CONN_SINGLE_SUPP" V 1550 4500 50  0000 C CNN
F 2 "~" H 1300 4550 60  0000 C CNN
F 3 "~" H 1300 4550 60  0000 C CNN
	1    1300 4550
	-1   0    0    -1  
$EndComp
Text GLabel 1500 4400 2    60   Input ~ 0
VDD
Text GLabel 1500 4550 2    60   Input ~ 0
GND
Text GLabel 1500 4700 2    60   Input ~ 0
SCL
Text GLabel 1500 4850 2    60   Input ~ 0
SDA4
$Comp
L BOLT_CONN_SINGLE_SUPP P7
U 1 1 55A05679
P 2900 3550
F 0 "P7" H 2900 3850 50  0000 C CNN
F 1 "BOLT_CONN_SINGLE_SUPP" V 3150 3500 50  0000 C CNN
F 2 "~" H 2900 3550 60  0000 C CNN
F 3 "~" H 2900 3550 60  0000 C CNN
	1    2900 3550
	-1   0    0    -1  
$EndComp
Text GLabel 3100 3400 2    60   Input ~ 0
VDD
Text GLabel 3100 3550 2    60   Input ~ 0
GND
Text GLabel 3100 3700 2    60   Input ~ 0
SCL
Text GLabel 3100 3850 2    60   Input ~ 0
SDA7
$Comp
L BOLT_CONN_SINGLE_SUPP P8
U 1 1 55A05683
P 2900 4550
F 0 "P8" H 2900 4850 50  0000 C CNN
F 1 "BOLT_CONN_SINGLE_SUPP" V 3150 4500 50  0000 C CNN
F 2 "~" H 2900 4550 60  0000 C CNN
F 3 "~" H 2900 4550 60  0000 C CNN
	1    2900 4550
	-1   0    0    -1  
$EndComp
Text GLabel 3100 4400 2    60   Input ~ 0
VDD
Text GLabel 3100 4550 2    60   Input ~ 0
GND
Text GLabel 3100 4700 2    60   Input ~ 0
SCL
Text GLabel 3100 4850 2    60   Input ~ 0
SDA8
$Comp
L MAX4617 MUX1
U 1 1 55A6BF8F
P 5350 3750
F 0 "MUX1" H 5350 4300 60  0000 C CNN
F 1 "MAX4617" H 5350 4200 60  0000 C CNN
F 2 "~" H 5350 4000 60  0000 C CNN
F 3 "~" H 5350 4000 60  0000 C CNN
	1    5350 3750
	1    0    0    -1  
$EndComp
$Comp
L HOST_CONNECTOR_SINGLE_SUPP P9
U 1 1 55A6C132
P 5350 1650
F 0 "P9" H 5350 1800 60  0000 C CNN
F 1 "HOST_CONNECTOR_SINGLE_SUPP" H 5350 1900 60  0000 C CNN
F 2 "~" H 5450 1550 60  0000 C CNN
F 3 "~" H 5450 1550 60  0000 C CNN
	1    5350 1650
	1    0    0    -1  
$EndComp
Text GLabel 4750 2050 3    60   Input ~ 0
SCL
Text GLabel 4900 2050 3    60   Input ~ 0
SDA
Text GLabel 4800 3600 0    60   Input ~ 0
SDA
Text GLabel 5350 2050 3    60   Input ~ 0
A
Text GLabel 5500 2050 3    60   Input ~ 0
B
Text GLabel 5650 2050 3    60   Input ~ 0
C
Text GLabel 5200 2050 3    60   Input ~ 0
GND
Text GLabel 5050 2050 3    60   Input ~ 0
VDD
Text GLabel 6500 3900 2    60   Input ~ 0
A
Text GLabel 6250 4000 2    60   Input ~ 0
B
Text GLabel 6000 4100 2    60   Input ~ 0
C
Text GLabel 6050 3400 2    60   Input ~ 0
VDD
NoConn ~ 4800 4000
Text GLabel 4800 4100 0    60   Input ~ 0
GND
Text GLabel 5900 3700 2    60   Input ~ 0
SDA3
Text GLabel 5900 3600 2    60   Input ~ 0
SDA2
Text GLabel 5900 3500 2    60   Input ~ 0
SDA1
Text GLabel 5900 3800 2    60   Input ~ 0
SDA4
Text GLabel 4800 3400 0    60   Input ~ 0
SDA7
Text GLabel 4800 3800 0    60   Input ~ 0
SDA8
Text GLabel 4800 3500 0    60   Input ~ 0
SDA5
Text GLabel 4800 3700 0    60   Input ~ 0
SDA6
Text GLabel 5800 2050 3    60   Input ~ 0
EN
Text GLabel 4400 3900 0    60   Input ~ 0
EN
$Comp
L R R2
U 1 1 55A80B34
P 6000 4450
F 0 "R2" V 6080 4450 40  0000 C CNN
F 1 "1k" V 6007 4451 40  0000 C CNN
F 2 "~" V 5930 4450 30  0000 C CNN
F 3 "~" H 6000 4450 30  0000 C CNN
	1    6000 4450
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 55A80B41
P 6250 4350
F 0 "R3" V 6330 4350 40  0000 C CNN
F 1 "1k" V 6257 4351 40  0000 C CNN
F 2 "~" V 6180 4350 30  0000 C CNN
F 3 "~" H 6250 4350 30  0000 C CNN
	1    6250 4350
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 55A80B47
P 6500 4250
F 0 "R4" V 6580 4250 40  0000 C CNN
F 1 "1k" V 6507 4251 40  0000 C CNN
F 2 "~" V 6430 4250 30  0000 C CNN
F 3 "~" H 6500 4250 30  0000 C CNN
	1    6500 4250
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 55A80B4F
P 6050 3200
F 0 "C1" H 6050 3300 40  0000 L CNN
F 1 "10nF" H 6056 3115 40  0000 L CNN
F 2 "~" H 6088 3050 30  0000 C CNN
F 3 "~" H 6050 3200 60  0000 C CNN
	1    6050 3200
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 55A80B5C
P 4400 4150
F 0 "R1" V 4480 4150 40  0000 C CNN
F 1 "1k" V 4407 4151 40  0000 C CNN
F 2 "~" V 4330 4150 30  0000 C CNN
F 3 "~" H 4400 4150 30  0000 C CNN
	1    4400 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 4100 6000 4200
Wire Wire Line
	6000 4100 5900 4100
Wire Wire Line
	5900 4000 6250 4000
Wire Wire Line
	6250 4000 6250 4100
Wire Wire Line
	6500 3900 6500 4000
Wire Wire Line
	6500 3900 5900 3900
Text GLabel 6000 4700 3    60   Input ~ 0
GND
Text GLabel 6250 4600 3    60   Input ~ 0
GND
Text GLabel 6500 4500 3    60   Input ~ 0
GND
Wire Wire Line
	4400 3900 4800 3900
Text GLabel 4400 4400 3    60   Input ~ 0
GND
Wire Wire Line
	5900 3400 6050 3400
Text GLabel 6050 3000 0    60   Input ~ 0
GND
$Comp
L R TEMP1
U 1 1 55CB7ED9
P 1600 5800
F 0 "TEMP1" V 1680 5800 40  0000 C CNN
F 1 "TEMP" V 1607 5801 40  0000 C CNN
F 2 "~" V 1530 5800 30  0000 C CNN
F 3 "~" H 1600 5800 30  0000 C CNN
	1    1600 5800
	0    -1   -1   0   
$EndComp
Text GLabel 5950 2050 3    60   Input ~ 0
TEMP
Text GLabel 1350 5800 0    60   Input ~ 0
VDD
$Comp
L R R5
U 1 1 55CB828C
P 2100 5800
F 0 "R5" V 2180 5800 40  0000 C CNN
F 1 "30k" V 2107 5801 40  0000 C CNN
F 2 "~" V 2030 5800 30  0000 C CNN
F 3 "~" H 2100 5800 30  0000 C CNN
	1    2100 5800
	0    -1   -1   0   
$EndComp
Text GLabel 2350 5800 2    60   Input ~ 0
GND
Text GLabel 1850 5800 3    60   Input ~ 0
TEMP
$EndSCHEMATC
