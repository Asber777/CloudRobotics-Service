#include <ros/ros.h>
// PCL specific includes
#include <sensor_msgs/PointCloud2.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/conversions.h>
#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
//关于平面分割的头文件
#include <pcl/sample_consensus/model_types.h>   
#include <pcl/sample_consensus/method_types.h>   
#include <pcl/segmentation/sac_segmentation.h>  
 
#include <iostream>
#include <pcl/ModelCoefficients.h>
#include <pcl/io/pcd_io.h>
#include <pcl/point_types.h>
#include <pcl/sample_consensus/method_types.h>
#include <pcl/sample_consensus/model_types.h>
#include <pcl/segmentation/sac_segmentation.h>
#include <pcl/visualization/cloud_viewer.h>
#include <pcl/filters/extract_indices.h>
 
 
 
ros::Publisher pub;
double L = 0.28;
double H = -0.4;
void
cloud_cb (const sensor_msgs::PointCloud2ConstPtr& input)
{
   std::string function_name = "cloud_cut";
    ROS_INFO("[%s]:cloud_cutCallback function!",function_name.c_str());
  // 将点云格式为sensor_msgs/PointCloud2 格式转为 pcl/PointCloud
 pcl::PointCloud<pcl::PointXYZ>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZ>);
 pcl::fromROSMsg (*input,*cloud);

 pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_no_gound(new pcl::PointCloud<pcl::PointXYZ>);
 
 for (int i = 0; i < cloud->points.size(); i++)
 {
   if (cloud->points[i].y < L && cloud->points[i].y >= H)
   {
     cloud_no_gound->points.push_back(cloud->points[i]);
   }
 }
  //再rviz上显示所以要转换回PointCloud2
  sensor_msgs::PointCloud2 output;
  pcl::toROSMsg(*cloud_no_gound,output);
  output.header = input->header;
  pub.publish (output);
}
 
int main (int argc, char** argv)
{
 
  ros::init (argc, argv, "yyf");
  ros::NodeHandle nh;
  ros::Subscriber sub = nh.subscribe ("/camera/depth/points", 1, cloud_cb);
  pub = nh.advertise<sensor_msgs::PointCloud2> ("/cloud_no_gound", 100);
  ros::spin ();
}
