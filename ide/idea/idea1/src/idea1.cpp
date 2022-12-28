#include<Arduino.h>

int X=0, Y=0, F;
 
void setup() {
  pinMode(2, OUTPUT);
}

void loop() {
 F = (!X&&Y) || (X&&!Y);
 digitalWrite(2,F);
}

