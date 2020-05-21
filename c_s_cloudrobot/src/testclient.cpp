#include "arcodelistener/client.h"
int main(int argc,char** argv)
{
    ros::init(argc, argv, "test_optim_node");
    ros::NodeHandle n("~");
    Client client(RegnizedObj);
    client.Call();//云端需要开启开启服务
    sleep(60);
    client.Stop();//云端需要开启关闭服务
    sleep(5);
    struct Location location;
    if(client.Find("可乐",&location))
    {
        ROS_INFO("toilet is  in x:%f;y:%f;z:%f",location.x,location.y,location.z);
    }
    else ROS_INFO("Select Failed");
    return 0;
}