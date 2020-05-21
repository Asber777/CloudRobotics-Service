#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>
#include <iostream>
#include <pcl_ros/point_cloud.h>
#include <pcl_conversions/pcl_conversions.h>
#include <pcl/point_types.h>
#include <pcl/features/normal_3d.h>
#include <pcl/features/normal_3d_omp.h>
#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include <time.h>

ros::Publisher pub_groundPoint;
ros::Publisher pub_nogroundPoint;

void oripointsCallback(const sensor_msgs::PointCloud2::ConstPtr& oripoints_msg)
{
    pcl::PointCloud<pcl::PointXYZI>::Ptr point_cloud_ptr(new pcl::PointCloud<pcl::PointXYZI>);
	pcl::fromROSMsg(*oripoints_msg, *point_cloud_ptr);
    
    double BestPlaneEquationCoefficient[4] = {0};
    double distance_threshold = 0.2;
    double height_threshold = 0.55;
    double P = 0.999;
    int iter_count = 0;
    int max_point_num = 0;
    int K = 100;


    pcl::PointCloud<pcl::PointXYZI>::Ptr GroundinitPoint_ptr(new pcl::PointCloud<pcl::PointXYZI>);
    pcl::PointCloud<pcl::PointXYZI>::Ptr GroundPoint_ptr(new pcl::PointCloud<pcl::PointXYZI>);
    pcl::PointCloud<pcl::PointXYZI>::Ptr GroundPointBest_ptr(new pcl::PointCloud<pcl::PointXYZI>);
    pcl::PointCloud<pcl::PointXYZI>::Ptr NoGroundPoint_ptr(new pcl::PointCloud<pcl::PointXYZI>);

#pragma omp for
    for (int i = 0; i < point_cloud_ptr->points.size(); i++)
    {
        if (point_cloud_ptr->points[i].z >= -1.16 && point_cloud_ptr->points[i].z <= -0.96)
        {
            GroundinitPoint_ptr->points.push_back(point_cloud_ptr->points[i]);
        }
    }


    while (iter_count < K)
    {
        GroundPoint_ptr->points.clear();
        int pointIndex[3] = { 0 };
        for (int i = 0; i < 3; i++)
        {
            pointIndex[i] = rand() % GroundinitPoint_ptr->points.size();
        }

        double x1 = GroundinitPoint_ptr->points[pointIndex[0]].x;
        double y1 = GroundinitPoint_ptr->points[pointIndex[0]].y;
        double z1 = GroundinitPoint_ptr->points[pointIndex[0]].z;
        double x2 = GroundinitPoint_ptr->points[pointIndex[1]].x;
        double y2 = GroundinitPoint_ptr->points[pointIndex[1]].y;
        double z2 = GroundinitPoint_ptr->points[pointIndex[1]].z;
        double x3 = GroundinitPoint_ptr->points[pointIndex[2]].x;
        double y3 = GroundinitPoint_ptr->points[pointIndex[2]].y;
        double z3 = GroundinitPoint_ptr->points[pointIndex[2]].z;

        double vectorProduct = (x2 - x1)*(x3 - x1) + (y2 - y1)*(y3 - y1) + (z2 - z1)*(z3 - z1);
        double vectorLength1 = sqrt((x2 - x1)*(x2 - x1) + (y2 - y1)*(y2 - y1) + (z2 - z1)*(z2 - z1));
        double vectorLength2 = sqrt((x3 - x1)*(x3 - x1) + (y3 - y1)*(y3 - y1) + (z3 - z1)*(z3 - z1));
        double vectorAngle = vectorProduct / (vectorLength1*vectorLength2);

        if (abs(vectorAngle) == 1)
        {
            continue;
        }

        double planeEquationCoefficient[4] = { 0 };

        planeEquationCoefficient[0] = (y2 - y1)*(z3 - z1) - (z2 - z1)*(y3 - y1);
        planeEquationCoefficient[1] = (z2 - z1)*(x3 - x1) - (x2 - x1)*(z3 - z1);
        planeEquationCoefficient[2] = (x2 - x1)*(y3 - y1) - (y2 - y1)*(x3 - x1);
        planeEquationCoefficient[3] = -(planeEquationCoefficient[0] * x1 + planeEquationCoefficient[1] * y1 + planeEquationCoefficient[2] * z1);
        
        for (int i = 0; i < GroundinitPoint_ptr->points.size(); i++)
        {
            double A = planeEquationCoefficient[0];
            double B = planeEquationCoefficient[1];
            double C = planeEquationCoefficient[2];
            double D = planeEquationCoefficient[3];
            double X = GroundinitPoint_ptr->points[i].x;
            double Y = GroundinitPoint_ptr->points[i].y;
            double Z = GroundinitPoint_ptr->points[i].z;
            double distance = abs(A*X + B*Y + C*Z + D) / (sqrt(A*A + B*B + C*C));

            if (distance < distance_threshold)
            {
                GroundPoint_ptr->points.push_back(GroundinitPoint_ptr->points[i]);
            } 
        }

        if (GroundPoint_ptr->points.size() > max_point_num)
        {
            GroundPointBest_ptr->points.clear();
            GroundPointBest_ptr->points.assign(GroundPoint_ptr->points.begin(),GroundPoint_ptr->points.end());
            max_point_num = GroundPointBest_ptr->points.size();

            for (int i = 0; i < 4; i++)
            {
                BestPlaneEquationCoefficient[i] = planeEquationCoefficient[i];
            }
            
            double GroundinitPointPtr_size = GroundinitPoint_ptr->points.size();
            double P_Ground = max_point_num / GroundinitPointPtr_size;
            double P_GroundTr = P_Ground*P_Ground*P_Ground;
            K = log(1 - P) / log(1 - P_GroundTr);
        }

        iter_count++;
        if (iter_count > K)
        {
            break;
        }
    }

    NoGroundPoint_ptr->points.clear();

#pragma omp for
    for (int i = 0; i < point_cloud_ptr->points.size(); i++)
    {
        double A = BestPlaneEquationCoefficient[0];
		double B = BestPlaneEquationCoefficient[1];
		double C = BestPlaneEquationCoefficient[2];
		double D = BestPlaneEquationCoefficient[3];
        double X = point_cloud_ptr->points[i].x;
        double Y = point_cloud_ptr->points[i].y;
        double Z = point_cloud_ptr->points[i].z;
        double height = abs(A*X + B*Y + C*Z + D) / sqrt(A*A + B*B + C*C);
        if (height > height_threshold)
        {
            NoGroundPoint_ptr->points.push_back(point_cloud_ptr->points[i]);
        }
    }

    sensor_msgs::PointCloud2 groundPoint_cloud_msg;
    sensor_msgs::PointCloud2 nogroundPoint_cloud_msg;
    pcl::toROSMsg(*GroundPointBest_ptr, groundPoint_cloud_msg);
    pcl::toROSMsg(*NoGroundPoint_ptr, nogroundPoint_cloud_msg);
    groundPoint_cloud_msg.header = oripoints_msg->header;
    nogroundPoint_cloud_msg.header = oripoints_msg->header;
    pub_groundPoint.publish(groundPoint_cloud_msg);
    pub_nogroundPoint.publish(nogroundPoint_cloud_msg);
}

int main(int argc, char **argv)
{
    srand((unsigned int)time(NULL));
    ros::init(argc, argv, "ransac_ground_detect");
    ros::NodeHandle nh;
    ros::Subscriber sub_ori = nh.subscribe("/camera/depth/points",1,oripointsCallback);
    pub_groundPoint = nh.advertise<sensor_msgs::PointCloud2>("/ransac_groundPoint",1000);
    pub_nogroundPoint = nh.advertise<sensor_msgs::PointCloud2>("/ransac_nogroundPoint",1000);
    ros::spin();
    return 0;
}

