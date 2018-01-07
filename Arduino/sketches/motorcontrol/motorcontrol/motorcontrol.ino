/* 
 * rosserial Subscriber Example
 * Blinks an LED on callback
 */

#include <ros.h>
#include <std_msgs/Float64.h>

ros::NodeHandle  nh;
int leftmotor = 5;
int rightmotor = 6;
float leftspeed = 127;
float rightspeed = 127;

void rmotorCb( const std_msgs::Float64& control_msg){
  
  rightspeed = control_msg.data;
  analogWrite(rightmotor,rightspeed);
}

void lmotorCb( const std_msgs::Float64& control_msg){
  
  leftspeed = control_msg.data;
  analogWrite(leftmotor,leftspeed);
}

ros::Subscriber<std_msgs::Float64> sub("rmotor", &rmotorCb );
ros::Subscriber<std_msgs::Float64> sub2("lmotor", &lmotorCb );
void setup()
{ 
  nh.initNode();
  nh.subscribe(sub);
  nh.subscribe(sub2);
}

void loop()
{  
  nh.spinOnce();
  delay(1);
}



