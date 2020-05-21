cmake_minimum_required(VERSION 2.8.3)
project(test_using_utility)
find_package(catkin REQUIRED COMPONENTS roscpp test_utility std_msgs)

find_package(catkin REQUIRED COMPONENTS
  roscpp
)

catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES test_using_utility
#  CATKIN_DEPENDS other_catkin_pkg
#  DEPENDS system_lib
)

include_directories(
  include ${catkin_INCLUDE_DIRS}
  ../test_a_utility/include
# ${catkin_INCLUDE_DIRS}
)


add_executable(test_using_utility
  src/test_using_utility.cpp
)
add_dependencies(test_using_utility ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(test_using_utility
  ${catkin_LIBRARIES}
)