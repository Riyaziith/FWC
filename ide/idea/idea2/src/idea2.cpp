#include<Arduino.h>


int X, Y, Z, F;

void setup() {
  pinMode(2, INPUT_PULLUP);
  pinMode(3, INPUT_PULLUP);
  pinMode(4, INPUT_PULLUP);
  pinMode(5, OUTPUT);
}  
  void loop() {
  
  X = digitalRead(2);
  Y = digitalRead(3);
  Z = digitalRead(4);
  F = (!X&&Y) || (X&&!Y);
  digitalWrite(5,F); 
}
