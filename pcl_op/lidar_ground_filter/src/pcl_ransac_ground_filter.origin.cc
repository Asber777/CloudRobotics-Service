#include <iostream>
#include <pcl_ros/point_cloud.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/ModelCoefficients.h>
#include <pcl/io/pcd_io.h>
#include <pcl/point_types.h>
#include <pcl/sample_consensus/method_types.h>
#include <pcl/sample_consensus/model_types.h>
#include <pcl/segmentation/sac_segmentation.h>
#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include <math.h>

#define _APP_NAME_ "pcl_ransac_ground_filter"

ros::Publisher groundPoint_pub;//输出地面的点云信息
ros::Publisher nogroundPoint_pub;//输出非地面的点云信息

void originalpointsCallback(const sensor_msgs::PointCloud2::ConstPtr& originalpoints_msg)
{
    std::string function_name = "originalpointsCallback";
    ROS_INFO("[%s][%s]:originalpointsCallback function!",_APP_NAME_,function_name.c_str());

    //Convert lidar point cloud from ros standard format to pcl format
    //将ROS的点云信息转化为pcl可以处理的格式
    pcl::PointCloud<pcl::PointXYZ>::Ptr point_cloud_original_ptr(new pcl::PointCloud<pcl::PointXYZ>);
    pcl::fromROSMsg(*originalpoints_msg, *point_cloud_original_ptr);

    //Preliminary screening of ground point clouds based on the height of the lidar installation
    //基于激光雷达安装高度的地面点云初步筛选（激光雷达的安装高度1.06m），高度在1.06m，所以地面的z就几乎是-1.16～-0.96范围内（20cm的冗余）
    //我估计turtlebot只有0.6m kinect的高度是0.45m（估计）总之我们把 z>=-1.0 <=-0.2的点加入吧
    pcl::PointCloud<pcl::PointXYZ>::Ptr point_cloud_screening_ptr(new pcl::PointCloud<pcl::PointXYZ>);

#pragma omp for
    
    for (int i = 0; i < point_cloud_original_ptr->points.size(); i++)
    {
        if (point_cloud_original_ptr->points[i].z >= -1.0 && point_cloud_original_ptr->points[i].z <= -0.2)
        {
            point_cloud_screening_ptr->points.push_back(point_cloud_original_ptr->points[i]);
        }
    }
    
    //pcl ground segmentation
    //点云地面分割
    pcl::ModelCoefficients::Ptr coefficients (new pcl::ModelCoefficients);
    pcl::PointIndices::Ptr inliers (new pcl::PointIndices);
    pcl::SACSegmentation<pcl::PointXYZ> seg;
    seg.setOptimizeCoefficients (true);
    seg.setModelType (pcl::SACMODEL_PLANE);
    seg.setMethodType (pcl::SAC_RANSAC);
    seg.setDistanceThreshold (0.01);
    seg.setInputCloud (point_cloud_screening_ptr);
    seg.segment (*inliers, *coefficients);

    //Using plane equation to segment ground points
    pcl::PointCloud<pcl::PointXYZ>::Ptr GroundPoint_ptr(new pcl::PointCloud<pcl::PointXYZ>);
    pcl::PointCloud<pcl::PointXYZ>::Ptr NoGroundPoint_ptr(new pcl::PointCloud<pcl::PointXYZ>);
    
    double A = coefficients->values[0];
    double B = coefficients->values[1];
    double C = coefficients->values[2];
    double D = coefficients->values[2];

#pragma omp for

    for (int i = 0; i < point_cloud_original_ptr->points.size(); i++)
    {
        double X = point_cloud_original_ptr->points[i].x;
        double Y = point_cloud_original_ptr->points[i].y;
        double Z = point_cloud_original_ptr->points[i].z;
        double height = abs(A*X + B*Y + C*Z + D) / sqrt(A*A + B*B + C*C); 
        //如果垂直距离小于0.01并且z小于-0.2 那么就认为是地面
        if ((height <= 0.01) && (point_cloud_original_ptr->points[i].z < -0.2) )
        {
            GroundPoint_ptr->points.push_back(point_cloud_original_ptr->points[i]);
        }
        else
        {
            NoGroundPoint_ptr->points.push_back(point_cloud_original_ptr->points[i]);
        }
    }

    //publish ground ptr and noground ptr
    sensor_msgs::PointCloud2 groundPoint_cloud_msg;
    sensor_msgs::PointCloud2 nogroundPoint_cloud_msg;
    pcl::toROSMsg(*GroundPoint_ptr, groundPoint_cloud_msg);
    pcl::toROSMsg(*NoGroundPoint_ptr, nogroundPoint_cloud_msg);
    groundPoint_cloud_msg.header = originalpoints_msg->header;
    nogroundPoint_cloud_msg.header = originalpoints_msg->header;
    groundPoint_pub.publish(groundPoint_cloud_msg);
    nogroundPoint_pub.publish(nogroundPoint_cloud_msg);
}

int main(int argc, char **argv)
{
    std::string function_name = "main";
    ROS_INFO("[%s][%s]:main function!",_APP_NAME_,function_name.c_str());
    ros::init(argc, argv, "pcl_ransac_ground_filter");
    ros::NodeHandle nh;
    ros::Subscriber original_points_sub = nh.subscribe("/camera/depth/points",1,originalpointsCallback);
    groundPoint_pub = nh.advertise<sensor_msgs::PointCloud2>("/ransac_groundPoint",1000);
    nogroundPoint_pub = nh.advertise<sensor_msgs::PointCloud2>("/ransac_nogroundPoint",1000);
    ros::spin();
    return 0;
}
