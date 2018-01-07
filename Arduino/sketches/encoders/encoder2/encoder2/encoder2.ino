/*
 * rosserial Publisher Example
 * Prints "hello world!"
 */

#include <ros.h>
#include <std_msgs/Float64.h>

ros::NodeHandle  nh;


std_msgs::Float64 encoder1_msg;
ros::Publisher encoder1("encoder2", &encoder1_msg);

const int channelB = 2;
const int channelA = 3;
//volatile int state = LOW; //to change variables in an ISR, need to define as volatile
volatile int countB = 0;
volatile int countA = 0;
int countp1;
int countp2;
float enc = 500;
float circ = 0.797;
float deltacount1;
float deltacount2;
float vel1;
float vel2;
volatile int toggleA = 0;

void setup()
{
  nh.initNode();
  nh.advertise(encoder1);
  pinMode(channelB, INPUT_PULLUP); //uses internal pullup resistors to prevent floating errors
  attachInterrupt(digitalPinToInterrupt(channelB), counterB, FALLING); //attach an interrupt to an ISR, our encoder increments on the falling edge of channel B
  pinMode(channelA, INPUT_PULLUP); //uses internal pullup resistors to prevent floating errors
  attachInterrupt(digitalPinToInterrupt(channelA), counterA, FALLING); //attach an interrupt to an ISR, our encoder increments on the falling edge of channel B
}

void loop()
{
  countp1 = countB;
  countp2 = countA;
  delay(500);
  deltacount1 = countB-countp1;
  deltacount2 = countA-countp2;
  vel1 = ((deltacount1/enc)*circ)/0.5;
  vel2 = ((deltacount2/enc)*circ)/0.5;
  encoder1_msg.data = (vel1 + vel2)/2.0;
  encoder1.publish( &encoder1_msg );
  nh.spinOnce();  
}

void counterB() {
  countB++;
}

void counterA() {
  countA++;
}


