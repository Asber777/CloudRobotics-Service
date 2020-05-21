# Install script for directory: /home/asber/catkin_ws/src/pcl/sample_consensus

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "pcl_sample_consensus")
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcl_sample_consensus.so.1.10.0.99"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcl_sample_consensus.so.1.10"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcl_sample_consensus.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "/usr/local/lib")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/asber/catkin_ws/src/pcl/build/lib/libpcl_sample_consensus.so.1.10.0.99"
    "/home/asber/catkin_ws/src/pcl/build/lib/libpcl_sample_consensus.so.1.10"
    "/home/asber/catkin_ws/src/pcl/build/lib/libpcl_sample_consensus.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcl_sample_consensus.so.1.10.0.99"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcl_sample_consensus.so.1.10"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcl_sample_consensus.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHANGE
           FILE "${file}"
           OLD_RPATH "/home/asber/catkin_ws/src/pcl/build/lib:"
           NEW_RPATH "/usr/local/lib")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "pcl_sample_consensus")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/asber/catkin_ws/src/pcl/build/sample_consensus/pcl_sample_consensus-1.10.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "pcl_sample_consensus")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pcl-1.10/pcl/sample_consensus" TYPE FILE FILES
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/boost.h"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/eigen.h"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/lmeds.h"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/method_types.h"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/mlesac.h"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/model_types.h"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/msac.h"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/ransac.h"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/rmsac.h"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/rransac.h"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/prosac.h"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/sac.h"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/sac_model.h"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/sac_model_circle.h"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/sac_model_circle3d.h"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/sac_model_cylinder.h"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/sac_model_cone.h"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/sac_model_line.h"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/sac_model_stick.h"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/sac_model_normal_parallel_plane.h"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/sac_model_normal_plane.h"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/sac_model_normal_sphere.h"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/sac_model_parallel_line.h"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/sac_model_parallel_plane.h"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/sac_model_perpendicular_plane.h"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/sac_model_plane.h"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/sac_model_registration.h"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/sac_model_registration_2d.h"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/sac_model_sphere.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "pcl_sample_consensus")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pcl-1.10/pcl/sample_consensus/impl" TYPE FILE FILES
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/impl/lmeds.hpp"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/impl/mlesac.hpp"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/impl/msac.hpp"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/impl/ransac.hpp"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/impl/rmsac.hpp"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/impl/rransac.hpp"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/impl/prosac.hpp"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/impl/sac_model_circle.hpp"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/impl/sac_model_circle3d.hpp"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/impl/sac_model_cylinder.hpp"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/impl/sac_model_cone.hpp"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/impl/sac_model_line.hpp"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/impl/sac_model_stick.hpp"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/impl/sac_model_normal_parallel_plane.hpp"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/impl/sac_model_normal_plane.hpp"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/impl/sac_model_normal_sphere.hpp"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/impl/sac_model_parallel_line.hpp"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/impl/sac_model_parallel_plane.hpp"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/impl/sac_model_perpendicular_plane.hpp"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/impl/sac_model_plane.hpp"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/impl/sac_model_registration.hpp"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/impl/sac_model_registration_2d.hpp"
    "/home/asber/catkin_ws/src/pcl/sample_consensus/include/pcl/sample_consensus/impl/sac_model_sphere.hpp"
    )
endif()

