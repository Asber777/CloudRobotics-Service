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
void prohibition2yaml(prohibition_msgs::prohibition prohibition)
{
    ofstream fout("/home/asber/catkin_ws/src/turtlebot_apps/turtlebot_navigation/param/recieved_prohibition_areas.yaml");
    YAML::Node config;
    ROS_INFO("heard yaml");
    std::vector<prohibition_msgs::point> points=prohibition.points;
    std::vector<prohibition_msgs::line> lines=prohibition.lines;
    std::vector<prohibition_msgs::area> areas=prohibition.areas;
    int num=points.size()+lines.size()+areas.size();
	vector<prohibition_msgs::point>::iterator iter1;
	for (iter1=points.begin();iter1!=points.end();iter1++)
	{
        YAML::Node point=YAML::Load("[]");
        point.push_back((*iter1).point1);
        point.push_back((*iter1).point2);
        config["prohibition_areas"].push_back(point);
	}
	vector<prohibition_msgs::line>::iterator iter2;
	for (iter2=lines.begin();iter2!=lines.end();iter2++)
	{
        YAML::Node line=YAML::Load("[]");
        YAML::Node point=YAML::Load("[]");
        point.push_back((*iter2).point_x1);
        point.push_back((*iter2).point_x2);
        line.push_back(point);
        YAML::Node point2=YAML::Load("[]");
        point2.push_back((*iter2).point_y1);
        point2.push_back((*iter2).point_y2);
        line.push_back(point2);
        config["prohibition_areas"].push_back(line);
	}
	vector<prohibition_msgs::area>::iterator iter3;
	for (iter3=areas.begin();iter3!=areas.end();iter3++)
	{
        std::vector<prohibition_msgs::point> area=(*iter3).area;
        vector<prohibition_msgs::point>::iterator iter4;
        YAML::Node area_yaml=YAML::Load("[]");
        for(iter4=area.begin();iter4!=area.end();iter4++)
        {
            YAML::Node point=YAML::Load("[]");
            point.push_back((*iter4).point1);
            point.push_back((*iter4).point2);
            area_yaml.push_back(point);
        }
        config["prohibition_areas"].push_back(area_yaml);
	}
    fout << config;
    fout.close();
}

int main(int argc, char **argv)			
{
    ros::init(argc, argv, "prohibition_msg_caller");		
    ros::NodeHandle nh;					
    ros::ServiceClient prohibition_msg_caller = nh.serviceClient<prohibition_msgs::prohibition_msg>("prohibition_msg");
    prohibition_msgs::prohibition_msg req;
    if (prohibition_msg_caller.call(req))
    {
        prohibition2yaml(req.response.prohibition);
    }
    else
    {
        ROS_ERROR("prohibition_msgs Failed to provide");
    }
    return 0;
}
