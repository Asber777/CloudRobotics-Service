#include "ros/ros.h"
#include "turtlesim/Pose.h"
#include "ar_track_alvar_msgs/AlvarMarkers.h"
#include "ar_track_alvar_msgs/AlvarMarker.h"
#include "geometry_msgs/PoseStamped.h"
#include <tf/transform_listener.h> 
#include <signal.h>
#include <stdio.h>
#include <sqlite3.h>
#include <cstdlib>
#include <arcodelistener/detect_object.h>
sqlite3 *db;
void mySigintHandler(int sig)
{
  // Do some custom action.
  // For example, publish a stop message to some other nodes.
  
  // All the default sigint handler does is call shutdown()
  sqlite3_close(db);
  ROS_INFO("mySigintHandler is called! DB closed~");
  ros::shutdown();
}
// 接收到订阅的消息后，会进入消息回调函数
void chatterCallback(const ar_track_alvar_msgs::AlvarMarkers::ConstPtr msg,const tf::TransformListener &listener)
{
    // 将接收到的消息打印出来
    std::vector<ar_track_alvar_msgs::AlvarMarker> MKS = msg->markers;
    if(MKS.size()!=0)
    {
        
        for(int i=0;i<MKS.size();i++){
            geometry_msgs::PointStamped origin_point;
            origin_point.point.x=MKS[i].pose.pose.position.x;
            origin_point.point.y=MKS[i].pose.pose.position.y;
            origin_point.point.z=MKS[i].pose.pose.position.y;
            origin_point.header.frame_id=MKS[i].header.frame_id;
            origin_point.header.stamp=ros::Time();
            string name ;
            stringstream ss;
            ss<<MKS[i].id;
            ss>>name;
            cout<< name<<endl;
            try
            {
                geometry_msgs::PointStamped base_point;
                listener.transformPoint("map", origin_point, base_point);
                DetectObject obj = DetectObject(name,ArCode,base_point.point.x,base_point.point.y,
                base_point.point.z,base_point.header.stamp.toSec(),db);
                ROS_INFO("x:%f,y:%f,z:%f,time:%f",obj.location.x,obj.location.y,obj.location.z,obj.time);
                if(!obj.FindIfHadOne()) 
                {
                    ROS_INFO("New Recong!");
                    if(obj.InsertOne())ROS_INFO("InSert Successfully");
                    else ROS_INFO("InSert Faultly");
                }
                else
                {
                    ROS_INFO("Already Recored..");
                }
            }
            catch (tf::TransformException &ex) {
                ROS_ERROR("%s",ex.what());
                ros::Duration(0.5).sleep();
            }
        }
    }
}


int main(int argc, char **argv)
{
    
    // 初始化ROS节点
    ros::init(argc, argv, "listener", ros::init_options::NoSigintHandler);
    // 创建节点句柄
    ros::NodeHandle n;
    // 创建一个Subscriber，订阅名为chatter的topic，注册回调函数chatterCallback
    tf::TransformListener listener(ros::Duration(10));
    signal(SIGINT, mySigintHandler);
    ROS_INFO("connecting detebase!");
    char *zErrMsg = 0;
    int rc;
    rc = sqlite3_open("/home/asber/sqlite3/test.db", &db);
    if( rc ){
        fprintf(stderr, "Can't open database: %s\n", sqlite3_errmsg(db));
        exit(0);
    }else{
        fprintf(stderr, "Opened database successfully\n");
    }
    
    
    ROS_INFO("subscribe Topic ar_pose_marker");
    ros::Subscriber sub = n.subscribe<ar_track_alvar_msgs::AlvarMarkers>("/ar_pose_marker", 10, boost::bind(&chatterCallback,_1,boost::ref(listener)));
    // 循环等待回调函数
    ros::spin();
    return 0;
}
