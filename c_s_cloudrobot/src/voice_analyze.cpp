#include <ros/ros.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>
#include "arcodelistener/my_move_base.h"
#include <std_msgs/String.h>
#include "arcodelistener/client.h"
#include <cstdlib>
int ar_pid = 0 ;
int obj_pid = 0 ;
void voice_call(const std_msgs::String::ConstPtr& voice_msg,Client ArCodeClient,Client RegnizedObjClient,ros::Publisher pub)
{
  printf("%s\n",voice_msg->data);
  if(voice_msg->data=="前进。")
  {
    printf("OK!Go ahead 1 m\n");
    GoToPlace("base_link",1.0,0.0);
    std_msgs::String msg;
    std::stringstream ss;
    ss << "我前进了一米" ;
    msg.data = ss.str();
    pub.publish(msg);
  }
  else if(voice_msg->data=="后退。")
  {
    printf("OK!Go back 1 m\n");
    GoToPlace("base_link",-1.0,0.0);
    std_msgs::String msg;
    std::stringstream ss;
    ss << "我后退了一米";
    msg.data = ss.str();
    pub.publish(msg);
  }
  else if(voice_msg->data=="去办公室。")
  {
    struct Location location; 
    std_msgs::String msg;
    std::stringstream ss;
    if(ArCodeClient.Find("办公室",&location))
    {
      if(location.x==0.0&&location.y==0.0)
      {
        ROS_INFO("Select Failed");
        ss << "不好意思，我不知道办公室在哪";
      }
      else
      {
        ROS_INFO("office is  in x:%f;y:%f;z:%f",location.x,location.y,location.z);
        GoToPlace("map",location.x,location.y);
        ss << "办公室到啦";
        printf("OK!Go to office \n");
      }
    }
    else
    {
      ROS_INFO("Select Failed");
      ss << "不好意思，我不知道办公室在哪";
    }
    msg.data = ss.str();
    pub.publish(msg);
  }
  else if(voice_msg->data=="去厕所。")
  {
    struct Location location;
    std_msgs::String msg;
    std::stringstream ss;
    if(ArCodeClient.Find("厕所",&location))
    {
      if(location.x==0.0&&location.y==0.0)
      {
        ROS_INFO("Select Failed");
        ss << "不好意思，我不知道厕所在哪";
      }
      else
      {
        ROS_INFO("toilet is  in x:%f;y:%f;z:%f",location.x,location.y,location.z);
        GoToPlace("map",location.x,location.y);
        ss << "厕所到啦";
        printf("OK!Go to toilet \n");
      }
    }
    else
    {
      ROS_INFO("Select Failed");
      ss << "不好意思，我不知道厕所在哪";
    }
    msg.data = ss.str();
    pub.publish(msg);
  }
  else if(voice_msg->data=="找一下可乐。")
  {
    struct Location location;
    std_msgs::String msg;
    std::stringstream ss;
    if(RegnizedObjClient.Find("可乐",&location))
    {
      if(location.x==0.0&&location.y==0.0)
      {
        ROS_INFO("Select Failed");
        ss << "不好意思，我不知道可乐在哪";
      }
      else
      {
        ROS_INFO("toilet is  in x:%f;y:%f;z:%f",location.x,location.y,location.z);
        GoToPlace("map",location.x,location.y);
        ss << "可乐就在这里";
        printf("OK!Go to  find coke  \n");
      }
    }
    else
    {
      ROS_INFO("Select Failed");
      ss << "不好意思，我不知道可乐在哪";
    }
    msg.data = ss.str();
    pub.publish(msg);
  }
  else if(voice_msg->data=="开启二维码识别服务。")
  {
    ArCodeClient.Call();
    ar_pid=ArCodeClient.get_pid();
    printf("OK!服务以开启 \n");
    std_msgs::String msg;
    std::stringstream ss;
    ss << "OK!服务以开启"<< ar_pid;
    msg.data = ss.str();
    pub.publish(msg);
  }
  else if(voice_msg->data=="开启物体识别服务。")
  {
    printf("准备开启物体识别服务。 \n");
    RegnizedObjClient.Call();
    obj_pid=RegnizedObjClient.get_pid();
    printf("OK!服务以开启 \n");
    std_msgs::String msg;
    std::stringstream ss;
    ss << "OK!服务以开启"<<obj_pid;
    msg.data = ss.str();
    pub.publish(msg);
  }
  else if(voice_msg->data=="关闭二维码识别服务。")
  {
    ArCodeClient.set_pid(ar_pid);
    ArCodeClient.Stop();
    printf("OK!服务以关闭 \n");
    std_msgs::String msg;
    std::stringstream ss;
    ss << "OK!服务以关闭"<< ar_pid;
    msg.data = ss.str();
    pub.publish(msg);
  }
  else if(voice_msg->data=="关闭物体识别服务。")
  {
    RegnizedObjClient.set_pid(obj_pid);
    RegnizedObjClient.Stop();
    printf("OK!服务以关闭 \n");
    std_msgs::String msg;
    std::stringstream ss;
    ss << "OK!服务以关闭"<<obj_pid;
    msg.data = ss.str();
    pub.publish(msg);
  }
}

int main(int argc, char** argv){
  ros::init(argc, argv, "listener", ros::init_options::NoSigintHandler);
  ros::NodeHandle n;
  Client ArCodeClient(ArCode);
  Client RegnizedObjClient(RegnizedObj);
  ros::Publisher pub = n.advertise<std_msgs::String>("/xfwords", 10);
  std_msgs::String msg;
  std::stringstream ss;
  ss << "服务机器人小黄竭诚为您服务" ;
  msg.data = ss.str();
  pub.publish(msg);
  ros::Subscriber sub = n.subscribe<std_msgs::String>("/xfspeech", 10,boost::bind(&voice_call,_1,boost::ref(ArCodeClient),
  boost::ref(RegnizedObjClient),boost::ref(pub)));
  ROS_INFO("OK");
  ros::spin();
} 
