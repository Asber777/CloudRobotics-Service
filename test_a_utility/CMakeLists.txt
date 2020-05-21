cmake_minimum_required(VERSION 2.8.3)
project(test_utility)
find_package(catkin REQUIRED COMPONENTS
  roscpp
  std_msgs
)
catkin_package(
  INCLUDE_DIRS include 
#  LIBRARIES test_utility
#  CATKIN_DEPENDS roscpp std_msgs
#  DEPENDS system_lib
)

include_directories(
  include 
  ${catkin_INCLUDE_DIRS}
)


add_library(test_utility
  src/test_utility.cpp
)
add_dependencies(test_utility ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(test_utility
  ${catkin_LIBRARIES}
)