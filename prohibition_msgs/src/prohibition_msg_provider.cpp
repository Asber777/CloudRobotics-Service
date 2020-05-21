#include "ros/ros.h"	
#include <iostream>
#include <fstream>				
#include "prohibition_msgs/prohibition.h"		
#include "prohibition_msgs/point.h"
#include "prohibition_msgs/line.h"
#include "prohibition_msgs/area.h"
#include "prohibition_msgs/prohibition_msg.h"
#include <string>
#include "yaml-cpp/yaml.h"
using namespace std;
bool callback(prohibition_msgs::prohibition_msg::Request &req,prohibition_msgs::prohibition_msg::Response &res)
{
    ROS_INFO("open /home/asber/catkin_ws/src/turtlebot_apps/turtlebot_navigation/param/prohibition_areas.yaml");
    YAML::Node config = YAML::LoadFile("/home/asber/catkin_ws/src/turtlebot_apps/turtlebot_navigation/param/prohibition_areas.yaml");
    int prohibition_msg_num = config["prohibition_areas"].size();
    prohibition_msgs::prohibition msg;
    std::vector<prohibition_msgs::point> points;
    std::vector<prohibition_msgs::line> lines;
    std::vector<prohibition_msgs::area> areas;
    for(int i = 0;i<prohibition_msg_num;i++)
    {
        if(config["prohibition_areas"][i].size()==2)
        {
            if(config["prohibition_areas"][i][0].IsScalar())//points
            {
                prohibition_msgs::point p;
                p.point1=config["prohibition_areas"][i][0].as<float>();
                p.point2=config["prohibition_areas"][i][1].as<float>();
                points.push_back(p);
            }
            else//lines
            {
                prohibition_msgs::line l;
                l.point_x1=config["prohibition_areas"][i][0][0].as<float>();
                l.point_x2=config["prohibition_areas"][i][0][1].as<float>();
                l.point_y1=config["prohibition_areas"][i][1][0].as<float>();
                l.point_y2=config["prohibition_areas"][i][1][1].as<float>();
                lines.push_back(l);
            }
        }
        else////肯定是areas
        {
            prohibition_msgs::area a_;
            std::vector<prohibition_msgs::point> a;
            for(int j=0;j<config["prohibition_areas"][i].size();j++)
            {
                prohibition_msgs::point p_temp;
                p_temp.point1=config["prohibition_areas"][i][j][0].as<float>();
                p_temp.point2=config["prohibition_areas"][i][j][1].as<float>();
                a.push_back(p_temp);
            }
            a_.area=a;
            areas.push_back(a_);
        }
    }
    msg.points=points;
    msg.lines=lines;
    msg.areas=areas;
    res.prohibition=msg;
    return true;
}                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               

int main(int argc, char **argv)			
{
    ros::init(argc, argv, "prohibition_msg_provider");		
    ros::NodeHandle nh;					
    ros::ServiceServer prohibition_msg_provider = nh.advertiseService("prohibition_msg",callback);
    ROS_INFO("ready prohibition_msg_provider server!");
    ros::spin();
    return 0;
}
