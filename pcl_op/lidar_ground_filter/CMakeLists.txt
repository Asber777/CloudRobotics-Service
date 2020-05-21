cmake_minimum_required(VERSION 2.8.3)
project(lidar_ground_filter)


add_compile_options(-std=c++11)

find_package(catkin REQUIRED COMPONENTS
  message_generation
  message_runtime
  pcl_ros
  pcl_conversions
  roscpp
  std_msgs
  sensor_msgs
)

generate_messages(
   DEPENDENCIES
   sensor_msgs  std_msgs
)

catkin_package(
  CATKIN_DEPENDS message_generation message_runtime pcl_ros roscpp sensor_msgs std_msgs
)

include_directories(
  include
  ${catkin_INCLUDE_DIRS}
)

add_executable(pcl_ransac_ground_filter src/pcl_ransac_ground_filter.cc )
add_dependencies(pcl_ransac_ground_filter ${catkin_EXPORTED_TARGETS})
target_link_libraries(pcl_ransac_ground_filter ${catkin_LIBRARIES})
