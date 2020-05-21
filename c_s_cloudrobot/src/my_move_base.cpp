#include "arcodelistener/my_move_base.h"

bool GoToPlace(std::string frame_id,float x,float y)
{
  MoveBaseClient ac("move_base", true);
  //wait for the action server to come up
  while(!ac.waitForServer(ros::Duration(5.0))){
    ROS_INFO("Waiting for the move_base action server to come up");
  }
  move_base_msgs::MoveBaseGoal goal;
  goal.target_pose.header.frame_id = frame_id;
  goal.target_pose.header.stamp = ros::Time::now();
  goal.target_pose.pose.position.x = x;
  goal.target_pose.pose.position.y = y;
  goal.target_pose.pose.position.z = 0;
  goal.target_pose.pose.orientation.w=1;
  goal.target_pose.pose.orientation.x=0;
  goal.target_pose.pose.orientation.y=0;
  goal.target_pose.pose.orientation.z=0;
  ROS_INFO("Sending goal");
  ac.sendGoal(goal);
  ac.waitForResult(ros::Duration(300.0));
  if(ac.getState() == actionlib::SimpleClientGoalState::SUCCEEDED)
    ROS_INFO("OK");
  else
    ROS_INFO("Faled");
  return 0;
}