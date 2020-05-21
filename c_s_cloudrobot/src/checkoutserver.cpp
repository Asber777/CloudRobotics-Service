#include "ros/ros.h"					// 如果有服务请求,将执行以下处理
#include "arcodelistener/RecongServerOn.h"	// 将服务请求设置为req,服务响应则设置为res。
#include "arcodelistener/TerminatePID.h"	// 将服务请求设置为req,服务响应则设置为res。
#include "arcodelistener/SelectFromSqlite3.h"	// 将服务请求设置为req,服务响应则设置为res。
#include <unistd.h>  
#include <stdlib.h>
#include <stdio.h>
#include <boost/format.hpp>
#include "arcodelistener/client.h"

using namespace std;
using namespace boost;
bool calculation1(arcodelistener::RecongServerOn::Request &req,arcodelistener::RecongServerOn::Response &res)
{
	pid_t fpid; //fpid表示fork函数返回的值
	fpid=fork(); 
  if (fpid < 0) 
		printf("error in fork!"); 
	else if (fpid == 0)
	{

    char * ar_execv_str[]= {"roslaunch","robot_vision","xinquan_ar_cloud_server.launch",NULL};
    char * obj_execv_str[] = {"roslaunch","robot_vision","xinquan_obj_cloud_server.launch",NULL};  
    if(req.servertype==1)
    {
      if (execv("/opt/ros/kinetic/bin/roslaunch",ar_execv_str) <0 )
      {  
      perror("error on exec");  
      exit(0);  
      } 
      printf("execv done\n\n");  
    }
    else if(req.servertype==2)
    {
      if (execv("/opt/ros/kinetic/bin/roslaunch",obj_execv_str) <0 )
      {  
      perror("error on exec");  
      exit(0);  
      }  
      printf("execv done\n\n");  
    }
	}
	else
	{
	    //parent process  
      cout<<"I am father,my pid is"<<getpid()<<" my son's pid is "<<fpid<<endl;
      res.pid = fpid;
	}
  return true;
}

bool calculation2(arcodelistener::TerminatePID::Request &req,arcodelistener::TerminatePID::Response &res)
{
    format fmt( "kill %1%" );
    fmt % req.pid; 
    const char* command = fmt.str().c_str();
    system(command);
    res.result=true;
    return true;
}

bool calculation3(arcodelistener::SelectFromSqlite3::Request &req,arcodelistener::SelectFromSqlite3::Response &res)
{
    ROS_INFO("connecting detebase!");
    char *zErrMsg = 0;
    int rc;
    sqlite3 *db;
    rc = sqlite3_open("/home/asber/sqlite3/test.db", &db);
    if( rc ){
        fprintf(stderr, "Can't open database: %s\n", sqlite3_errmsg(db));
        exit(0);
    }else{
        fprintf(stderr, "Opened database successfully\n");
    }
    DetectObject obj=DetectObject(req.name,req.type,db);
    ROS_INFO("closed detebase!");
    if(obj.Select())
    {
        printf("在x:%f;y:%f;z:%f\n",obj.location.x,obj.location.y,obj.location.z);
        res.x=obj.location.x;
        res.y=obj.location.y;
        res.z=obj.location.z;
        sqlite3_close(db);
        return true;
    }
    else
    {
        printf("Select Failed");
        sqlite3_close(db);
        return false;
    }
}

int main(int argc, char **argv) // 节点主函数
{
  ros::init(argc, argv, "checkoutserver"); 	 // 初始化节点名称
  ros::NodeHandle nh; 		 // 声明节点句柄

  // 声明服务服务器
  // 声明利用ros_tutorials_service功能包的SrvTutorial服务文件的
  // 服务服务器ros_tutorials_service_server
  // 服务名称是ros_tutorial_srv,且当有服务请求时,执行calculation函数。
  ros::ServiceServer ros_tutorials_service_server1 = nh.advertiseService("RecongServerOn",calculation1);
  ROS_INFO("ready srv server!");
  ros::ServiceServer ros_tutorials_service_server2 = nh.advertiseService("TerminatePID",calculation2);
  ROS_INFO("ready terminate server!");
  ros::ServiceServer ros_tutorials_service_server3 = nh.advertiseService("SelectFromSqlite3",calculation3);
  ROS_INFO("ready SelectFromSqlite3 server!");
  ros::spin(); // 等待服务请求
  return 0;
}
