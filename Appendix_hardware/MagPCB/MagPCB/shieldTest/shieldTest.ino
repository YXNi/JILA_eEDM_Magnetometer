/**********************************
Magnetometer Arduino Communication Code
1> make sure use modified libraries
2> send R to get 3 float bx by bz
3> send S to get string
4> send P/N/C to set positive strap/negative strap/cancel strap
5> send D to use strap to degauss the chip
6> send T to check temperature
   
JILA eEDM
***********************************/

#include <Wire.h>
#include <MagLibrary.h>


MagLibrary mag[8];//mag register array
magvec event[8];//measuring event array

#define EN 22
#define C  24
#define B  26
#define A  28

void setup(){
  Serial.begin(115200);
  pinMode(A,OUTPUT);
  pinMode(B,OUTPUT);
  pinMode(C,OUTPUT);
  pinMode(EN,OUTPUT);
  digitalWrite(EN,0);
  for(int i=0;i<8;i++){    
    selectMag(i+1);    
    mag[i]=MagLibrary();
    mag[i].begin(&event[i]);
  }  
  analogReadResolution(12);    
}

void loop(){
  if (Serial.available()>0){
    char cmd = Serial.read();
    switch(cmd){
      case 'S':
        takeDataString();
        break;
      case 'R':
        takeData();
        break;
    }    
  }    
}

void takeData(){//that takes and sends measure the data
  for(int i=0;i<8;i++){
    selectMag(i+1);
    mag[i].getEvent(&event[i]);    
    send_double(event[i].x);
    send_double(event[i].y);
    send_double(event[i].z);
  }
}

void takeDataString(){  
  for(int i=0;i<8;i++){    
    selectMag(i+1);
    mag[i].getEvent(&event[i]);    
    Serial.print("Mag#");Serial.println(i+1);
    Serial.print(" x:");Serial.print(event[i].x,6);Serial.print(', ');
    Serial.print(" y:");Serial.print(event[i].y,6);Serial.print(', ');
    Serial.print(" z:");Serial.println(event[i].z,6);    
  }  
}

void send_double (float arg)
{
  // get access to the float as a byte-array:
  byte * data = (byte *) &arg; 

  // write the data to the serial
  Serial.write(data, sizeof(arg));
}

void selectMag(int m){
  switch(m){
    case 1:
      digitalWrite(C,0);
      digitalWrite(B,1);
      digitalWrite(A,0);
      break;    
    case 2:
      digitalWrite(C,0);
      digitalWrite(B,0);
      digitalWrite(A,1);
      break;
    case 3:
      digitalWrite(C,0);
      digitalWrite(B,0);
      digitalWrite(A,0);
      break;
    case 4:
      digitalWrite(C,0);
      digitalWrite(B,1);
      digitalWrite(A,1);
      break;     
    case 5:
      digitalWrite(C,1);
      digitalWrite(B,1);
      digitalWrite(A,0);
      break;    
    case 6:
      digitalWrite(C,1);
      digitalWrite(B,1);
      digitalWrite(A,1);
      break;
    case 7:
      digitalWrite(C,1);
      digitalWrite(B,0);
      digitalWrite(A,0);
      break;
    case 8:
      digitalWrite(C,1);
      digitalWrite(B,0);
      digitalWrite(A,1);
      break;                
  }
}
