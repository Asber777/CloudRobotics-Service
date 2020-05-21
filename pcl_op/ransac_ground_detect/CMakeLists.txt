cmake_minimum_required(VERSION 2.8.3)
project(ransac_ground_detect)

add_compile_options(-std=c++11)


find_package(catkin REQUIRED COMPONENTS
  roscpp
  std_msgs
  pcl_ros
  pcl_conversions
  sensor_msgs
)




catkin_package(
  CATKIN_DEPENDS roscpp std_msgs pcl_ros pcl_conversions sensor_msgs
)


include_directories(
  include
  ${catkin_INCLUDE_DIRS}
)

add_executable(ransac_ground_detect src/ransac_ground_detect.cc )
add_dependencies(ransac_ground_detect ${catkin_EXPORTED_TARGETS})
target_link_libraries(ransac_ground_detect ${catkin_LIBRARIES})
