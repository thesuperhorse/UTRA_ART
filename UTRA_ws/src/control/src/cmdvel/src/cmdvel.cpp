#include "ros/ros.h"
#include "std_msgs/Float64.h"
#include "nav_msgs/Odometry.h"
#include "geometry_msgs/Twist.h"

double vx,vy,wz;
double wheelbase = 0.91; // meters

void targetcb(const geometry_msgs::Twist& msg)
{
  vx = msg.linear.x;
  vy = msg.linear.y;
  wz = msg.angular.z;
}

double convertr(double vel)
{
  double mcommand = 127 + (80.5*vel);
  return mcommand;
}

double convertl(double vel)
{
  double mcommand = 127 + (80.5*vel);
  return mcommand;
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "cmdvel");
  ros::NodeHandle n;
  ros::Time current_time,prev_time;
  current_time = ros::Time::now();

  ros::Subscriber sub1 = n.subscribe("cmd_vel", 1000, targetcb);
  ros::Publisher rvel_pub = n.advertise<std_msgs::Float64>("/right_wheel/setpoint", 50);
  ros::Publisher lvel_pub = n.advertise<std_msgs::Float64>("/left_wheel/setpoint", 50);
  ros::Rate loop_rate(10);

  std_msgs::Float64 rvelmsg;
  std_msgs::Float64 lvelmsg;	

  double v,vl,vr,rcommand,lcommand;
  

  while(n.ok())
  { 
    ros::spinOnce(); //check for msgs, updates xi,yi,azi,x,y,z

    v = sqrt(pow(vx,2) + pow(vy,2)) ; //the following expressions are derived from wheel odometry equations - approximating arcs as lines
    vr = v + (wheelbase*wz)/2 ;
    vl = v - (wheelbase*wz)/2 ;
    rvelmsg.data = vr;
    lvelmsg.data = vl; 

    rvel_pub.publish(rvelmsg);
    lvel_pub.publish(lvelmsg);
  }
  return 0;
}



