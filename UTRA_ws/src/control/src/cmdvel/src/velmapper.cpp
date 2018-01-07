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

  ros::Subscriber sub1 = n.subscribe("encoder1", 1000, enc1cb);
  ros::Subscriber sub2 = n.subscribe("encoder2", 1000, enc2cb);
  ros::Publisher rcom_pub = n.advertise<std_msgs::Float64>("rmotor", 50);
  ros::Publisher lcom_pub = n.advertise<std_msgs::Float64>("lmotor", 50);
  ros::Rate loop_rate(10);

  std_msgs::Float64 rcommsg;
  std_msgs::Float64 lcommsg;	

  /*Collect the required measurements*/ 
  double rcommand,lcommand,one;
  one = 1.0;
  MatrixXf A(2601,3);
  VectorXf wr(3);
  VectorXf wl(3);
  VectorXf yr(2601);
  VectorXf yl(2601);
  rcommand = 0;
  lcommand = 0;
  for(int i=0;i<51;i++){
    for(int j=0;j<51;j++){
      if(!n.ok()){
        return -1;
      }
      rcommsg.data = rcommand;
      lcommsg.data = lcommand;
      rcom_pub.publish(rcommsg);
      lcom_pub.publish(lcommsg);
      sleep(1); //wait 1 sec for motor to fully react to the command
      ros::spinOnce(); //read the encoder values
      A(j+i*51,0) = one;
      A(j+i*51,1) = rcommand;
      A(j+i*51,2) = lcommand;
      yr(j+i*51) = enc1;
      yl(j+i*51) = enc2;
      lcommand+=5;
      cout << "right velocity is :\n" << enc1 << endl;
      cout << "left velocity is :\n" << enc2 << endl;
    }
    cout << "Updated 51 rows :\n" << A.block(i*51,0,51,3) << endl;
    rcommand+=5; 
  } 
  
  /*Save our measurements to files, in case of failure during least squares fitting*/
  std::ofstream file1("measurements.txt");
  if (file1.is_open())
  {
    file1 << "Vector yr :\n" << yr << endl;
    file1 << "Vector yl :\n" << yl << endl; 
    file1 << "Matrix A :\n" << A << endl;
  }  
  file1.close();
  
  /*Solve for the weights*/
  JacobiSVD<MatrixXf> svd(A, ComputeThinU | ComputeThinV);
  wr = svd.solve(yr);
  wl = svd.solve(yl);
  
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

  return 0;
}



