#include "ros/ros.h"
#include "std_msgs/Float64.h"
#include "std_msgs/Int64.h"
#include "tf/tf.h"
#include "tf/transform_broadcaster.h"
#include "nav_msgs/Odometry.h"
#include "geometry_msgs/TransformStamped.h"
#include "geometry_msgs/Quaternion.h"


float vl=0;
float vr=0; 
float wheelbase = 0.91; // meters
float vrd = 1;
float vld = 1;

void enc1cb(const std_msgs::Float64& msg)
{
  vr = msg.data;  
}

void enc2cb(const std_msgs::Float64& msg)
{
  vl = msg.data;
}

void enc1cb2(const std_msgs::Float64& msg)
{
  if(msg.data > 127){
    vrd = 1;
  }
  else{
    vrd = -1;
  }  
}

void enc2cb2(const std_msgs::Float64& msg)
{
  if(msg.data > 127){
    vld = 1;
  }
  else{
    vld = -1;
  }  
}
int main(int argc, char **argv)
{
  ros::init(argc, argv, "odom");
  ros::NodeHandle n;
  ros::Time current_time,prev_time;
  current_time = ros::Time::now();

  double v = 0;
  double vxo = 0;
  double vyo = 0;
  double vx = 0;
  double vy = 0;
  double wz = 0;
  double wzo = 0;
  double x = 0;
  double y = 0;
  double thz = 0; //IMU will populate this, but use odom for now.
  double dt = 0;

  ros::Subscriber sub1 = n.subscribe("encoder1", 1000, enc1cb);
  ros::Subscriber sub2 = n.subscribe("encoder2", 1000, enc2cb);
  ros::Subscriber sub3 = n.subscribe("rmotor", 1000, enc1cb2);
  ros::Subscriber sub4 = n.subscribe("lmotor", 1000, enc2cb2);
  ros::Publisher odom_pub = n.advertise<nav_msgs::Odometry>("odom", 50);
  ros::Publisher test_pub = n.advertise<std_msgs::Float64>("test", 50);
  ros::Rate loop_rate(10);

  std_msgs::Float64 msg;
  nav_msgs::Odometry odom;
  geometry_msgs::TransformStamped odom_trans;
  geometry_msgs::Quaternion odom_quat;
  tf::TransformBroadcaster odom_broadcaster;

  while(n.ok())
  { 
    vxo = vx;
    vyo = vy;
    wzo =  wz;
    prev_time = current_time; 
    ros::spinOnce(); //check for msgs
    current_time = ros::Time::now();
    dt = (current_time - prev_time).toSec();
    /* calculate linear and angular velocites */  
    vr = vr * vrd; //direction of speed...
    vl = vl * vld;                                                  
    v = (vr + vl) / 2.0 ;
    wz = (vr - vl) / wheelbase ;

    /*inv kin */
    thz = thz + (dt*(wzo + wz)/2.0); //trapz rule     
    vx = v*sin(thz);
    vy = v*cos(thz);
    x = x + (dt*(vxo + vx)/2.0);
    y = y + (dt*(vyo + vy)/2.0);
    odom_quat = tf::createQuaternionMsgFromYaw(thz); //orientation quat

    /*publish the transform over tf */
    odom_trans.header.stamp = current_time;
    odom_trans.header.frame_id = "odom";
    odom_trans.child_frame_id = "base_link";

    odom_trans.transform.translation.x = x;
    odom_trans.transform.translation.y = y;
    odom_trans.transform.translation.z = 0.0;
    odom_trans.transform.rotation = odom_quat;

    odom_broadcaster.sendTransform(odom_trans);

    /*publish the odometry message over ROS*/
    odom.header.stamp = current_time;
    odom.header.frame_id = "odom";

    //set the position
    odom.pose.pose.position.x = x;
    odom.pose.pose.position.y = y;
    odom.pose.pose.position.z = 0.0;
    odom.pose.pose.orientation = odom_quat;

    //set the velocity
    odom.child_frame_id = "base_link";
    odom.twist.twist.linear.x = (vxo + vx)/2.0;
    odom.twist.twist.linear.y = (vyo + vy)/2.0;
    odom.twist.twist.angular.z = (wzo + wz)/2.0;

    //publish the message
    msg.data = vr;
    test_pub.publish(msg);
    odom_pub.publish(odom);
  }
  return 0;
}



