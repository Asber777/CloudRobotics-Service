#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include <iostream>
#include <pcl_ros/point_cloud.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/point_types.h>
#include <pcl/features/normal_3d.h>
#include <pcl/features/normal_3d_omp.h>
//关于平面分割的头文件
#include <pcl/sample_consensus/model_types.h>   
#include <pcl/sample_consensus/method_types.h>   
#include <pcl/segmentation/sac_segmentation.h>  
//ros::Publisher pub_groundPoint;
ros::Publisher pub_nogroundPoint;

void oripointsCallback(const sensor_msgs::PointCloud2::ConstPtr& input)
{
  pcl::PointCloud<pcl::PointXYZI>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZI>);
  pcl::PointCloud<pcl::PointXYZ>::Ptr cloud_filtered(new pcl::PointCloud<pcl::PointXYZ>);
  pcl::fromROSMsg(*input, *cloud);

  pcl::ModelCoefficients::Ptr coefficients (new pcl::ModelCoefficients);//申明模型的参数
  pcl::PointIndices::Ptr inliers (new pcl::PointIndices);//申明存储模型的内点的索引
  pcl::SACSegmentation<pcl::PointXYZ> seg;  // 创建一个分割方法
  seg.setOptimizeCoefficients (true);  // 这一句可以选择最优化参数的因子
  seg.setModelType (pcl::SACMODEL_PLANE);   //平面模型
  seg.setMethodType (pcl::SAC_RANSAC);    //分割平面模型所使用的分割方法
  seg.setMaxIterations(1000);   //设置最大的循环次数
  seg.setDistanceThreshold (0.01);        //设置最小的阀值距离 0.01
  seg.setInputCloud(cloud);   //设置输入的点云
  seg.segment (*inliers,*coefficients);  
 
  // 把提取出来的外点 -> ros发布出去
  pcl::ExtractIndices<pcl::PointXYZ> extract;
  extract.setInputCloud (cloud);
  extract.setIndices (inliers);
  extract.setNegative (true);
  extract.filter (*cloud_filtered);
  //再rviz上显示所以要转换回PointCloud2
  sensor_msgs::PointCloud2 output;  
  pcl::toROSMsg(*cloud_filtered,output);
  pub_nogroundPoint.publish (output);
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "ransac_ground_detect");
    ros::NodeHandle nh;
    ros::Subscriber sub_ori = nh.subscribe("/left/rslidar_points",1,oripointsCallback);
    //pub_groundPoint = nh.advertise<sensor_msgs::PointCloud2>("/ransac_groundPoint",1000);
    pub_nogroundPoint = nh.advertise<sensor_msgs::PointCloud2>("/ransac_nogroundPoint",1000);
    ros::spin();
    return 0;
}

