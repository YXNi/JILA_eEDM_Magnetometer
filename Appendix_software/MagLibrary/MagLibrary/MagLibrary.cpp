/***************************************************************************
  This is a library for the HMC5883 magnentometer/compass

  Designed specifically to work with the Adafruit HMC5883 Breakout
  http://www.adafruit.com/products/1746

  These displays use I2C to communicate, 2 pins are required to interface.

  Adafruit invests time and resources providing this open source code,
  please support Adafruit andopen-source hardware by purchasing products
  from Adafruit!

  Written by Kevin Townsend for Adafruit Industries.
  BSD license, all text above must be included in any redistribution
 ***************************************************************************/

 /*************************************************************************
 This library is based on original communication protocol of Honeywell HMC5883
 and open source of Adafuit breakout board library.
 
 Modification was made by YXNi for JILA eEDM experiment.
 **************************************************************************/
 
#include "Arduino.h"
#include <Wire.h>
#include <limits.h>
#include "MagLibrary.h"

static float _hmc5883_Gauss_LSB = 1100.0F;  // Setup chip gain


void MagLibrary::write8(byte address, byte reg, byte value)
{
  Wire.beginTransmission(address);
  Wire.write((uint8_t)reg);
  Wire.write((uint8_t)value);
  Wire.endTransmission();
}

/**************************************************************************/
/*!
    @brief  Abstract away platform differences in Arduino wire library
*/
/**************************************************************************/
byte MagLibrary::read8(byte address, byte reg)
{
  byte value;
  Wire.beginTransmission(address);
  Wire.write((uint8_t)reg);
  Wire.endTransmission();
  Wire.requestFrom(address, (byte)1);
  value = Wire.read();
  Wire.endTransmission();

  return value;
}

/**************************************************************************/
/*!
    @brief  Reads the raw data from the sensor
*/
/**************************************************************************/
void MagLibrary::read()
{
  // Read the magnetometer
  Wire.beginTransmission((byte)HMC5883_ADDRESS_MAG);
  Wire.write(HMC5883_REGISTER_MAG_OUT_X_H_M);
  Wire.endTransmission();

  Wire.requestFrom((byte)HMC5883_ADDRESS_MAG, (byte)6);

  // Wait around until enough data is available
  lp=0;
  while (Wire.available() < 6){
		lp++;//break loop by looping order
		if(lp>20){//this value trades off speed and reading patience
			state = false;
			break;
		}
  }

  // Note high before low, read out each x,y,z axis magnetic field
	uint8_t xhi = Wire.read();
	uint8_t xlo = Wire.read();
	uint8_t zhi = Wire.read();
	uint8_t zlo = Wire.read();
	uint8_t yhi = Wire.read();
	uint8_t ylo = Wire.read();

	  // Shift values to create properly formed integer (low byte first)
	if(state==true){
		_magData.x = (int16_t)(xlo | ((int16_t)xhi << 8));
		_magData.y = (int16_t)(ylo | ((int16_t)yhi << 8));
		_magData.z = (int16_t)(zlo | ((int16_t)zhi << 8));
	}
}

/***************************************************************************
 CONSTRUCTOR
 ***************************************************************************/

/**************************************************************************/
/*!
    @brief  Instantiates a new Adafruit_HMC5883 class
*/
/**************************************************************************/
MagLibrary::MagLibrary() {
	state = true;
}

/***************************************************************************
 PUBLIC FUNCTIONS
 ***************************************************************************/

/**************************************************************************/
/*!
    @brief  Setups the HW
*/
/**************************************************************************/
void MagLibrary::begin(magvec* event)
{
  // Enable I2C, and give 200ms communication establish time.

  t1=millis();
  Wire.begin();

  // Enable the magnetometer
  write8(HMC5883_ADDRESS_MAG, HMC5883_REGISTER_MAG_MR_REG_M, 0x00);

  //Set the measurement frequency to 75Hz
  write8(HMC5883_ADDRESS_MAG, HMC5883_REGISTER_MAG_CRA_REG_M, 0x18);

  // Set the gain to a known level
  setMagGain(HMC5883_MAGGAIN_1_3);

  t2=millis();

  if(t2-t1<200){
	  state = true;//communication success
  }
  else{
	  state = false;//communication failure
  }

  read();
  if ((_magData.x+_magData.y+_magData.z)==0) state = false;

}

/**************************************************************************/
/*!
    @brief  Sets the magnetometer's gain
*/
/**************************************************************************/
void MagLibrary::setMagGain(hmc5883MagGain gain)
{
  write8(HMC5883_ADDRESS_MAG, HMC5883_REGISTER_MAG_CRB_REG_M, (byte)gain);

  delay(100);

  _magGain = gain;

  switch(gain)
  {
    case HMC5883_MAGGAIN_1_3:
      _hmc5883_Gauss_LSB = 1100;
      break;
    case HMC5883_MAGGAIN_1_9:
      _hmc5883_Gauss_LSB = 855;
      break;
    case HMC5883_MAGGAIN_2_5:
      _hmc5883_Gauss_LSB = 670;
      break;
    case HMC5883_MAGGAIN_4_0:
      _hmc5883_Gauss_LSB = 450;
      break;
    case HMC5883_MAGGAIN_4_7:
      _hmc5883_Gauss_LSB = 400;
      break;
    case HMC5883_MAGGAIN_5_6:
      _hmc5883_Gauss_LSB = 330;
      break;
    case HMC5883_MAGGAIN_8_1:
      _hmc5883_Gauss_LSB = 230;
      break;
  }
}

/**************************************************************************/
/*!
    @brief  Gets the most recent sensor event
*/
/**************************************************************************/
void MagLibrary::getEvent(magvec *event) {
  /* Clear the event */
  //memset(event, 0, sizeof(sensors_event_t));

  /* Read new data */
	read();
	if(state==true){
		event->x = _magData.x / _hmc5883_Gauss_LSB;
		event->y = _magData.y / _hmc5883_Gauss_LSB;
		event->z = _magData.z / _hmc5883_Gauss_LSB;
	}
	else{
		event->x = 0xFFFF;
		event->y = 0xFFFF;
		event->z = 0xFFFF;
	}
}

void MagLibrary::setStrap(bool setSign){
	if(state==true){
		if(setSign==true){
			write8(HMC5883_ADDRESS_MAG, HMC5883_REGISTER_MAG_CRA_REG_M, 0b00011001);
		}
		else{
			write8(HMC5883_ADDRESS_MAG, HMC5883_REGISTER_MAG_CRA_REG_M, 0b00011010);
		}
		delay(100);
	}
}

/************************************************************************
Functions for sensor degauss
************************************************************************/

void MagLibrary::cancelStrap(void){
	if(state==true){
		write8(HMC5883_ADDRESS_MAG, HMC5883_REGISTER_MAG_CRA_REG_M, 0x18);
		delay(100);
	}
}

void MagLibrary::dGauss(int strapCounts){
  if (state==true){
    if(strapCounts>0){
  		magvec dgaussEvent;
  		for(int i=0;i<strapCounts;i++){
  			setStrap(true);
  			getEvent(&dgaussEvent);
  			delay(14);
  			setStrap(false);
  			getEvent(&dgaussEvent);
  			delay(14);
  		}
  		cancelStrap();
  		// Serial.println("done");
  	}
  }
}

void MagLibrary::getStrap(magvec *strap){
  if(state==true){
    setStrap(true);
    magvec positive;
    getEvent(&positive);
    getEvent(&positive);
    setStrap(false);
    magvec negative;
    getEvent(&negative);
    getEvent(&negative);
    cancelStrap();
    strap->x = (positive.x-negative.x)/2;
    strap->y = (positive.y-negative.y)/2;
    strap->z = (positive.z-negative.z)/2;
  }
  else{
    strap->x = 0xFFFF;
    strap->y = 0xFFFF;
    strap->z = 0xFFFF;
  }
}
