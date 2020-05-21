#include "ros/ros.h"
#include "turtlesim/Pose.h"
#include "object_recognition_msgs/RecognizedObjectArray.h"
#include "object_recognition_msgs/RecognizedObject.h"
#include "geometry_msgs/PoseStamped.h"
#include <tf/transform_listener.h> 
#include <signal.h>
#include <stdio.h>
#include <sqlite3.h>
#include <cstdlib>
#include <arcodelistener/detect_object.h>
sqlite3 *DB;
void mySigintHandler(int sig)
{
  // Do some custom action.
  // For example, publish a stop message to some other nodes.
  
  // All the default sigint handler does is call shutdown()
  sqlite3_close(DB);
  ROS_INFO("mySigintHandler is called! DB closed~");
  ros::shutdown();
}
// 接收到订阅的消息后，会进入消息回调函数
void chatterCallback(const object_recognition_msgs::RecognizedObjectArray::ConstPtr msg,const tf::TransformListener &listener)
{
    // 将接收到的消息打印出来
    std::vector<object_recognition_msgs::RecognizedObject> OBJ = msg->objects;
    if(OBJ.size()!=0)
    {
        
        for(int i=0;i<OBJ.size();i++){
            geometry_msgs::PointStamped origin_point;
            // string key =OBJ[i].type.key;
            // string db =OBJ[i].type.db;
            origin_point.point.x=OBJ[i].pose.pose.pose.position.x;
            origin_point.point.y=OBJ[i].pose.pose.pose.position.y;
            origin_point.point.z=OBJ[i].pose.pose.pose.position.z;
            origin_point.header.frame_id=OBJ[i].header.frame_id;
            origin_point.header.stamp=ros::Time();
            try
            {
                geometry_msgs::PointStamped base_point;
                listener.transformPoint("/map", origin_point, base_point);
                DetectObject obj = DetectObject(OBJ[i].type.key,RegnizedObj,base_point.point.x,base_point.point.y,
                base_point.point.z,base_point.header.stamp.toSec(),DB);
                ROS_INFO("OBJ:x:%f,y:%f,z:%f,time:%f",obj.location.x,obj.location.y,obj.location.z,obj.time);
                if(!obj.FindIfHadOne()) 
                {
                    ROS_INFO("New Recong!");
                    if(obj.InsertOne())ROS_INFO("InSert Successfully");
                    else ROS_INFO("InSert Faultly");
                }
                else
                {
                    ROS_INFO("Already Recored.. OR FindIfExistFaled");
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
    rc = sqlite3_open("/home/asber/sqlite3/test.db", &DB);
    if( rc ){
        fprintf(stderr, "Can't open database: %s\n", sqlite3_errmsg(DB));
        exit(0);
    }else{
        fprintf(stderr, "Opened database successfully\n");
    }
    
    
    ROS_INFO("subscribe Topic ar_pose_marker");
    ros::Subscriber sub = n.subscribe<object_recognition_msgs::RecognizedObjectArray>("/recognized_object_array", 10, boost::bind(&chatterCallback,_1,boost::ref(listener)));
    // 循环等待回调函数
    ros::spin();
    return 0;
}
