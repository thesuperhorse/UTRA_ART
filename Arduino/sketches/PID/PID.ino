//robot forward is both above 127
//backward is both below 127
int leftmotor = 5;
int rightmotor = 6;

void setup() {
  Serial.begin(57600);

}

void loop() {
 
  analogWrite(6,127);
  analogWrite(5,127);
  
}
