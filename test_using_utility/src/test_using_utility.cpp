#include <ros/ros.h>
#include "test_utility/test_utility.h"
#include <iostream>

int main(int argc, char** argv)
{
    ros::init(argc, argv, "test");
    ros::NodeHandle nh;

    //Utility u;
    float x =0;// u.dosomething(32);

    std::cout << x << std::endl;

    ros::spin();
    return 0;
}
 