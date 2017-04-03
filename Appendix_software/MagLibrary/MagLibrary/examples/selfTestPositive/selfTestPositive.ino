/**********************************
Magnetometer Arduino Communication Code
1> make sure use modified libraries
2> send R to get 3 float bx by bz
3> send S to get string
4> send P/N/C to set positive strap/negative strap/cancel strap
5> send D to use strap to degauss the chip
   
JILA eEDM
***********************************/

#include <Wire.h>
#include <MagLibrary.h>


MagLibrary mag;//mag register array
magvec event;//measuring event array
bool state;
char gainIn;
char gainSet='L';//initial gain from lib is 1.9G


void setup(){
  Serial.begin(115200);    
  mag=MagLibrary();
  state = mag.begin();  
}

void loop(){
  if (Serial.available()>0){
    gainIn=Serial.read();
    if(gainIn=='N'){//if the gain set is different from command      
      mag.setStrap(false);      
    }
    else if(gainIn=='P'){
      mag.setStrap(true);
    }
    else if(gainIn=='C'){
      mag.cancelStrap();
    }
    else if(gainIn=='R'){
      takeData();
    }
    else if(gainIn=='S'){
      takeDataString();
    }
    else if(gainIn=='D'){
      mag.dGauss(100);
    }
  }
}

void takeData(){//that takes and sends measure the data
  state = mag.getEvent(&event);
  send_double(event.x);
  send_double(event.y);
  send_double(event.z);
}

void takeDataString(){
  state = mag.getEvent(&event);
  Serial.println(event.x);
  Serial.println(event.y);
  Serial.println(event.z);
}

void send_double (float arg)
{
  // get access to the float as a byte-array:
  byte * data = (byte *) &arg; 

  // write the data to the serial
  Serial.write(data, sizeof(arg));
}