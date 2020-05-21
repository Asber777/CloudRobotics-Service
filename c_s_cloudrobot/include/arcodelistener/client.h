#include "ros/ros.h" // ROS的基本头文件
#include "arcodelistener/RecongServerOn.h"	 // SrvTutorial服务头文件(构建后自动生成)
#include <cstdlib> // 使用atoll函数所需的库
#include "arcodelistener/TerminatePID.h"
#include "arcodelistener/detect_object.h"
#include "arcodelistener/SelectFromSqlite3.h"
#include <string>
using namespace std;
class Client
{
    protected:
      objectType serverType;
      int pid;
      ros::NodeHandle Callnh;
      ros::NodeHandle Stopnh;
      ros::NodeHandle Findnh;
      ros::ServiceClient Call_client;
      ros::ServiceClient Stop_client;
      ros::ServiceClient Find_client;
    public:
      Client(objectType serverType);
      ~Client();
      int get_pid();
      bool set_pid(int);
      bool Call();
      bool Stop();
      bool Find(string name,struct Location*);
};