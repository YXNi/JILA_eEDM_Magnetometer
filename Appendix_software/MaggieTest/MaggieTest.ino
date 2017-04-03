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


MagLibrary mag[8][8];//mag register array
magvec event[8][8];//measuring event array
byte bstate[8];

const int EN[8] = {45,43,41,39,37,35,33,31};
#define C  4//24
#define B  3//26
#define A  2//28

void setup(){ 
  Serial.begin(250000);     
  Serial.println("start setup"); 
  analogReadResolution(12);
  
  pinMode(A,OUTPUT);
  pinMode(B,OUTPUT);
  pinMode(C,OUTPUT);

  for(int i=0;i<8;i++){
    pinMode(EN[i],OUTPUT);
    digitalWrite(EN[i],1); //turn off all the boards
    bstate[i] = false;
  }
  
  for(int j=0;j<1;j++){
    selectBoard(j);   
    for(int i=0;i<8;i++){    
      selectMag(i); 
      
      mag[j][i]=MagLibrary();
      mag[j][i].begin(&event[j][i]);
      bstate[j] = bstate[j]|mag[j][i].state;

//      Serial.println(mag[j][i].state);      
    } 
    send_bstate(j); 
  }    
  Serial.println("done setup");
}

void loop(){
  if (Serial.available()>0){
    char cmd = Serial.read();
    Serial.println(cmd);
    switch(cmd){
      case 'a':
        Serial.println('A');
        takeDataString(0);
        break;
      case 'b':
        Serial.println('B');
        takeDataString(1);
        break;
      case 'c':
        Serial.println('C');
        takeDataString(2);
        break;
      case 'd':
        Serial.println('D');
        takeDataString(3);
        break;
      case 'e':
        Serial.println('E');
        takeDataString(4);
        break;
      case 'f':
        Serial.println('F');
        takeDataString(5);
        break;
      case 'g':
        Serial.println('G');
        takeDataString(6);
        break;
      case 'h':
        Serial.println('H');
        takeDataString(7);
        break; 
      case 'A':
        takeData(0);
        break;
      case 'B':
        takeData(1);
        break;
      case 'C':
        takeData(2);
        break;
      case 'D':
        takeData(3);
        break;
      case 'E':
        takeData(4);
        break;
      case 'F':
        takeData(5);
        break;
      case 'G':
        takeData(6);
        break;
      case 'H':
        takeData(7);
        break;         
    }    
  }         
}

void takeData(int j){//that takes and sends measure the data
  selectBoard(j);    
  for(int i=0;i<8;i++){
    if (mag[j][i].state==true){
      selectMag(i);
      mag[j][i].getEvent(&event[j][i]);    
      send_double(event[j][i].x);
      send_double(event[j][i].y);
      send_double(event[j][i].z);
    }
    else{
      send_3nan();      
    }
  }      
}


void takeDataString(int j){
  selectBoard(j);
    
  for(int i=0;i<8;i++){
    Serial.print("Mag#");Serial.println(i+1);        
    if (mag[j][i].state==true){
      selectMag(i);
      mag[j][i].getEvent(&event[j][i]);          
      Serial.print(" x:");Serial.print(event[j][i].x,6);Serial.print(', ');
      Serial.print(" y:");Serial.print(event[j][i].y,6);Serial.print(', ');
      Serial.print(" z:");Serial.println(event[j][i].z,6);    
    }
    else
      Serial.println("unconnected");
  }  
}

void send_bstate(int j){
  Serial.write(bstate[j]);
}

void send_3nan(){
  send_double(NAN);
  send_double(NAN);
  send_double(NAN);
}

void send_double (float arg)
{
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
