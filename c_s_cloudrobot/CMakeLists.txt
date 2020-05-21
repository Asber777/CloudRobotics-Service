cmake_minimum_required(VERSION 2.8.3)
project(arcodelistener)
find_package(catkin REQUIRED COMPONENTS actionlib_msgs message_generation std_msgs roscpp std_msgs move_base_msgs actionlib)
find_package(catkin REQUIRED COMPONENTS
  roscpp
  tf
)
add_service_files(
  FILES
  SelectFromSqlite3.srv
  TerminatePID.srv
  RecongServerOn.srv
)
generate_messages(DEPENDENCIES
#  actionlib_msgs
  std_msgs
)
catkin_package(
  CATKIN_DEPENDS
  message_runtime
  INCLUDE_DIRS include
  LIBRARIES arcodelistener
  CATKIN_DEPENDS std_msgs roscpp
#  DEPENDS system_lib
)
include_directories(
  include ${catkin_INCLUDE_DIRS}
)
link_directories(
  ${catkin_LIB_DIRS} lib
)

add_executable(ar_code_listener src/AR_listener.cpp)
target_link_libraries(ar_code_listener
 ${catkin_LIBRARIES} 
   sqlite3
  detect_object)
add_dependencies(ar_code_listener ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})


add_library(detect_object
  src/detect_object.cpp
)
add_dependencies(detect_object ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(detect_object
  ${catkin_LIBRARIES}
)




add_executable(ORK_listener
  src/ORK_listener.cpp
)
add_dependencies(ORK_listener ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(ORK_listener
  ${catkin_LIBRARIES}
  sqlite3
  detect_object
)

add_executable(checkoutserver
  src/checkoutserver.cpp
)
add_dependencies(checkoutserver ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(checkoutserver
  ${catkin_LIBRARIES}
  sqlite3 detect_object 
)

add_library(cloudclient
  src/client.cpp
)
add_dependencies(cloudclient ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(cloudclient
  ${catkin_LIBRARIES}
)


add_executable(testclient
  src/testclient.cpp
)
add_dependencies(testclient ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(testclient
  ${catkin_LIBRARIES} 
  cloudclient
)

add_library(my_move_base
  src/my_move_base.cpp
)
add_dependencies(my_move_base ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(my_move_base
  ${catkin_LIBRARIES}
)



add_executable(voice_analyze
  src/voice_analyze.cpp
)
add_dependencies(voice_analyze ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(voice_analyze
  ${catkin_LIBRARIES}
  my_move_base
  cloudclient
)