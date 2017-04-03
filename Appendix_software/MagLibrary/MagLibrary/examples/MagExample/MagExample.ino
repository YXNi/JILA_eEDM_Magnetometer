/**********************************
Magnetometer Arduino Communication Code
1> make sure use modified libraries
2> send H to read high gain send L read low gain
   receive data/state/gain
3> send F to fresh magnetometers
   receive state/gain
   
JILA eEDM
***********************************/
#include <WSWire.h> 
#include <MagLibrary.h>


#define MUX_A0 4//MUX pins
#define MUX_A1 5
#define MUX_A2 6

MagLibrary mag[8];//mag register array
bool state[8];//mag states array
magvec event[8];//measuring event array
byte allState;
char gainIn;
char gainSet='L';//initial gain from lib is 1.9G


void setup(){
  Serial.begin(115200);
  
  pinMode(MUX_A0, OUTPUT);
  pinMode(MUX_A1, OUTPUT);
  pinMode(MUX_A2, OUTPUT);
    
  for(int i=0;i<8;i++){
    mag[i]=MagLibrary();
    sensorSelect(i);
    state[i]=mag[i].begin();
  }
}

void loop(){
  if (Serial.available()>0){
    gainIn=Serial.read();
    if(gainIn!=gainSet){//if the gain set is different from command      
      if(gainIn=='H'){//set the gain to high 8.1G
        gainSet=gainIn;
        for(int i=0;i<8;i++){
          sensorSelect(i);
          if(state[i]){
            mag[i].setMagGain(HMC5883_MAGGAIN_8_1);
          }
        }
        delay(100);
        takeData();
      }
      else if(gainIn=='L'){//set gain to low 1.9G
        gainSet=gainIn;
        for(int i=0;i<8;i++){
          sensorSelect(i);
          if(state[i]){
            mag[i].setMagGain(HMC5883_MAGGAIN_1_9);
          }
        }
        delay(100);
        takeData();
      }
      else if(gainIn=='F'){//refresh the magnetometer
        for(int i=0;i<8;i++){
          mag[i]=MagLibrary();
          sensorSelect(i);
          state[i]=mag[i].begin();
        }
        gainSet = 'L';
        sendState();
        sendGain();
      }      
    }
    else{      
      takeData();
    }
  }
}//end of loop

void takeData(){//that takes and sends measure the data
  for(int i=0;i<8;i++){
    sensorSelect(i);
    if(state[i]){
      state[i]=mag[i].getEvent(&event[i]);
      if(state[i]){
        send_double(event[i].x);
        send_double(event[i].y);
        send_double(event[i].z);            
      }
      else{
          send_double(0xFF);
          send_double(0xFF);
          send_double(0xFF);
        }
    }
    else{
      send_double(0xFF);
      send_double(0xFF);
      send_double(0xFF);
      }        
  }//end of for
  sendState();
  sendGain();
}


void sensorSelect(int index)
{
  if (index == 0){
    digitalWrite(MUX_A0, LOW);
    digitalWrite(MUX_A1, LOW);
    digitalWrite(MUX_A2, LOW);
  }
  else if (index == 1){
    digitalWrite(MUX_A0, HIGH);
    digitalWrite(MUX_A1, LOW);
    digitalWrite(MUX_A2, LOW);
  }
  else if (index == 2){
    digitalWrite(MUX_A0, LOW);
    digitalWrite(MUX_A1, HIGH);
    digitalWrite(MUX_A2, LOW);
  }
  else if (index == 3){
    digitalWrite(MUX_A0, HIGH);
    digitalWrite(MUX_A1, HIGH);
    digitalWrite(MUX_A2, LOW);
  }
  else if (index == 4){
    digitalWrite(MUX_A0, LOW);
    digitalWrite(MUX_A1, LOW);
    digitalWrite(MUX_A2, HIGH);
  }
  else if (index == 5){
    digitalWrite(MUX_A0, HIGH);
    digitalWrite(MUX_A1, LOW);
    digitalWrite(MUX_A2, HIGH);
  }
  
  else if (index == 6){
    digitalWrite(MUX_A0, LOW);
    digitalWrite(MUX_A1, HIGH);
    digitalWrite(MUX_A2, HIGH);
  }
  else if (index == 7){
    digitalWrite(MUX_A0, HIGH);
    digitalWrite(MUX_A1, HIGH);
    digitalWrite(MUX_A2, HIGH);
  }  
}

void send_double (double arg)
{
  // get access to the float as a byte-array:
  byte * data = (byte *) &arg; 

  // write the data to the serial
  Serial.write(data, sizeof(arg));
}

void sendState(){//send a byte of mag states
  allState=0;
  for(int i=0;i<8;i++){   
    allState=state[i]<<i^allState;
  }
  Serial.write(allState);
}

void sendGain(){
  Serial.write(gainSet);
}