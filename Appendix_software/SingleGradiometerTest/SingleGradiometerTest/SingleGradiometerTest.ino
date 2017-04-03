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

const int EN[8] = {45,43,41,39,37,35,33,31};
#define C  4//24
#define B  3//26
#define A  2//28

void setup(){ 
  Serial.begin(250000);     
  analogReadResolution(12);
  
  pinMode(A,OUTPUT);
  pinMode(B,OUTPUT);
  pinMode(C,OUTPUT);

  for(int i=0;i<8;i++){
    pinMode(EN[i],OUTPUT);
    digitalWrite(EN[i],1); //turn off all the boards
  }
  
  selectBoard(0);   
  for(int i=0;i<8;i++){    
    selectMag(i);       
    mag[i]=MagLibrary();
    mag[i].begin(&event[i]);
  }
}

void loop(){
  if (Serial.available()>0){
    char cmd = Serial.read();    
    switch(cmd){
      case 'a':
        Serial.println('A');
        takeDataString();
        break;      
      case 'A':
        takeData();
        break; 
      case 's':
        printState();
        break;
      case '1':
        takeMag(0);
        break;         
      case '2':
        takeMag(1);
        break;         
      case '3':
        takeMag(2);
        break;         
      case '4':
        takeMag(3);
        break;         
      case '5':
        takeMag(4);
        break;         
      case '6':
        takeMag(5);
        break;         
      case '7':
        takeMag(6);
        break;         
      case '8':
        takeMag(7);
        break;         
      
    }    
  }         
}

void takeData(){//that takes and sends measure the data    
  for(int i=0;i<8;i++){
    if (mag[i].state==true){
      selectMag(i);
      mag[i].getEvent(&event[i]);          
      send_double(event[i].x);
      send_double(event[i].y);
      send_double(event[i].z);
    }
    else{
      send_3nan();      
    }
  }      
}

void takeMag(int i){
  selectMag(i);    
  if(mag[i].state==true){
    mag[i].getEvent(&event[i]);
    Serial.print("Mag#:");Serial.println(i+1);
    Serial.print(" x:");Serial.print(event[i].x,6);Serial.print(', ');
    Serial.print(" y:");Serial.print(event[i].y,6);Serial.print(', ');
    Serial.print(" z:");Serial.println(event[i].z,6);
  }
  else
    Serial.println("unconnected");
}

void printState(){
  Serial.println("mag states");

  for(int i=0;i<8;i++){
    Serial.print("Mag#:");Serial.println(i+1);
    Serial.println(mag[i].state); 
  }
}

void takeDataString(){
  for(int i=0;i<8;i++){
    Serial.print("Mag#");Serial.println(i+1);        
    if (mag[i].state==true){
      selectMag(i);
      mag[i].getEvent(&event[i]);          
      Serial.print(" x:");Serial.print(event[i].x,6);Serial.print(', ');
      Serial.print(" y:");Serial.print(event[i].y,6);Serial.print(', ');
      Serial.print(" z:");Serial.println(event[i].z,6);    
    }
    else
      Serial.println("unconnected");
  }  
}

void send_3nan(){
  send_double(NAN);
  send_double(NAN);
  send_double(NAN);
}

void send_double (float arg){
  // get access to the float as a byte-array:
  byte * data = (byte *) &arg; 

  // write the data to the serial
  Serial.write(data, sizeof(arg));
}

void selectBoard(int b){
  for(int i=0;i<8;i++){
    digitalWrite(EN[i],HIGH);
  }
  digitalWrite(EN[b],LOW);
}

void selectMag(int m){
  switch(m){
    case 0:
      digitalWrite(C,0);
      digitalWrite(B,1);
      digitalWrite(A,0);
      break;    
    case 1:
      digitalWrite(C,0);
      digitalWrite(B,0);
      digitalWrite(A,1);
      break;
    case 2:
      digitalWrite(C,0);
      digitalWrite(B,0);
      digitalWrite(A,0);
      break;
    case 3:
      digitalWrite(C,0);
      digitalWrite(B,1);
      digitalWrite(A,1);
      break;     
    case 4:
      digitalWrite(C,1);
      digitalWrite(B,1);
      digitalWrite(A,0);
      break;    
    case 5:
      digitalWrite(C,1);
      digitalWrite(B,1);
      digitalWrite(A,1);
      break;
    case 6:
      digitalWrite(C,1);
      digitalWrite(B,0);
      digitalWrite(A,0);
      break;
    case 7:
      digitalWrite(C,1);
      digitalWrite(B,0);
      digitalWrite(A,1);
      break;                
  }
}
