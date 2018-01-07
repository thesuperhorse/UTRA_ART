#include "ros/ros.h"
#include "std_msgs/Float64.h"
#include <iostream>
#include <Eigen/Dense>
#include "geometry_msgs/Twist.h"
#include <fstream>

using namespace Eigen;
using namespace std;

double enc1,enc2;

void enc1cb(const std_msgs::Float64& msg)
{
  enc1 = msg.data;
}

void enc2cb(const std_msgs::Float64& msg)
{
  enc2 = msg.data;
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "cmdvel");
  ros::NodeHandle n;
  ros::Time current_time,prev_time;
  current_time = ros::Time::now();

  ros::Subscriber sub1 = n.subscribe("encoder1_node/encoder1", 1000, enc1cb);
  ros::Subscriber sub2 = n.subscribe("encoder2_node/encoder2", 1000, enc2cb);
  ros::Publisher rcom_pub = n.advertise<std_msgs::Float64>("motor_node/rmotor", 50);
  ros::Publisher lcom_pub = n.advertise<std_msgs::Float64>("motor_node/lmotor", 50);
  ros::Rate loop_rate(10);

  std_msgs::Float64 rcommsg;
  std_msgs::Float64 lcommsg;	

  /*Collect the required measurements*/ 
  double rcommand,lcommand,one;
  one = 1.0;
  MatrixXf Ar(255,2);
  MatrixXf Al(255,2);
  VectorXf wr(2);
  VectorXf wl(2);
  VectorXf yr(255);
  VectorXf yl(255);
  rcommand = 0;
  lcommand = 127;
  rcommsg.data = rcommand;
  rcom_pub.publish(rcommsg);
  sleep(10);
  for(int i=0;i<255;i++){
    if(!n.ok()){
      return -1;
    }
    rcommsg.data = rcommand;
    lcommsg.data = lcommand;
    rcom_pub.publish(rcommsg);
    lcom_pub.publish(lcommsg);
    sleep(2); //wait 1 sec for motor to fully react to the command
    ros::spinOnce(); //read the encoder values
    if(rcommand < 127){
      enc1 = enc1 * -1.0;
    }
    if(lcommand < 127){
      enc2 = enc2 * -1.0;
    }
    Ar(i,0) = one;
    Ar(i,1) = enc1;
    yr(i) = rcommand;
    rcommand++; 
    cout << "Command is :\n" << rcommand << endl;
    cout << "and velocity is:\n" << enc1 << endl;
  }

  rcommand = 127;
  lcommand = 0;
  lcommsg.data = lcommand;
  lcom_pub.publish(lcommsg);
  sleep(10);
  for(int i=0;i<255;i++){
    if(!n.ok()){
      return -1;
    }
    rcommsg.data = rcommand;
    lcommsg.data = lcommand;
    rcom_pub.publish(rcommsg);
    lcom_pub.publish(lcommsg);
    sleep(2); //wait 1 sec for motor to fully react to the command
    ros::spinOnce(); //read the encoder values
    if(rcommand < 127){
      enc1 = enc1 * -1.0;
    }
    if(lcommand < 127){
      enc2 = enc2 * -1.0;
    }
    Al(i,0) = one;
    Al(i,1) = enc2;
    yl(i) = lcommand;
    lcommand++;
    cout << "Command is :\n" << lcommand << endl;
    cout << "and velocity is:\n" << enc2 << endl;
  }

  
  /*Save our measurements to files, in case of failure during least squares fitting*/
  std::ofstream file1("measurements.txt");
  if (file1.is_open())
  {
    file1 << "Vector yr :\n" << yr << endl;
    file1 << "Vector yl :\n" << yl << endl; 
    file1 << "Matrix Ar :\n" << Ar << endl;
    file1 << "Matrix Al :\n" << Al << endl;
  }  
  file1.close();
  
  /*Solve for the weights*/
  JacobiSVD<MatrixXf> svdr(Ar, ComputeThinU | ComputeThinV);
  JacobiSVD<MatrixXf> svdl(Al, ComputeThinU | ComputeThinV);
  wr = svdr.solve(yr);
  wl = svdl.solve(yl);
  
  std::ofstream file2("weights.txt");
  if (file2.is_open())
  {
    file2 << "Vector wr :\n" << wr << endl;
    file2 << "Vector wl :\n" << wl << endl;
  }  
  file2.close();

  cout << "The least squares solution for the right motor is" << wr << endl;
  cout << "The least squares solution for the left motor is" << wl << endl;
  cout << "Peace out :)" << endl;
  rcommsg.data = 127;
  lcommsg.data = 127;
  rcom_pub.publish(rcommsg);
  lcom_pub.publish(lcommsg); 
  return 0;
}



