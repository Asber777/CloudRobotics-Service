# Install script for directory: /home/asber/catkin_ws/src/pcl

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

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "pcl_common")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pcl-1.10/pcl" TYPE FILE FILES "/home/asber/catkin_ws/src/pcl/build/include/pcl/pcl_config.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "pclconfig")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pcl-1.10/Modules" TYPE FILE FILES
    "/home/asber/catkin_ws/src/pcl/cmake/Modules/FindPcap.cmake"
    "/home/asber/catkin_ws/src/pcl/cmake/Modules/FindEigen.cmake"
    "/home/asber/catkin_ws/src/pcl/cmake/Modules/UseCompilerCache.cmake"
    "/home/asber/catkin_ws/src/pcl/cmake/Modules/FindSphinx.cmake"
    "/home/asber/catkin_ws/src/pcl/cmake/Modules/FindEnsenso.cmake"
    "/home/asber/catkin_ws/src/pcl/cmake/Modules/FindOpenNI.cmake"
    "/home/asber/catkin_ws/src/pcl/cmake/Modules/FinddavidSDK.cmake"
    "/home/asber/catkin_ws/src/pcl/cmake/Modules/FindOpenNI2.cmake"
    "/home/asber/catkin_ws/src/pcl/cmake/Modules/FindClangFormat.cmake"
    "/home/asber/catkin_ws/src/pcl/cmake/Modules/Findlibusb-1.0.cmake"
    "/home/asber/catkin_ws/src/pcl/cmake/Modules/FindRSSDK.cmake"
    "/home/asber/catkin_ws/src/pcl/cmake/Modules/FindRSSDK2.cmake"
    "/home/asber/catkin_ws/src/pcl/cmake/Modules/FindFLANN.cmake"
    "/home/asber/catkin_ws/src/pcl/cmake/Modules/FindQhull.cmake"
    "/home/asber/catkin_ws/src/pcl/cmake/Modules/FindDSSDK.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "pclconfig")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/pcl-1.10" TYPE FILE FILES
    "/home/asber/catkin_ws/src/pcl/build/PCLConfig.cmake"
    "/home/asber/catkin_ws/src/pcl/build/PCLConfigVersion.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/asber/catkin_ws/src/pcl/build/common/cmake_install.cmake")
  include("/home/asber/catkin_ws/src/pcl/build/kdtree/cmake_install.cmake")
  include("/home/asber/catkin_ws/src/pcl/build/octree/cmake_install.cmake")
  include("/home/asber/catkin_ws/src/pcl/build/search/cmake_install.cmake")
  include("/home/asber/catkin_ws/src/pcl/build/sample_consensus/cmake_install.cmake")
  include("/home/asber/catkin_ws/src/pcl/build/filters/cmake_install.cmake")
  include("/home/asber/catkin_ws/src/pcl/build/2d/cmake_install.cmake")
  include("/home/asber/catkin_ws/src/pcl/build/features/cmake_install.cmake")
  include("/home/asber/catkin_ws/src/pcl/build/io/cmake_install.cmake")
  include("/home/asber/catkin_ws/src/pcl/build/tracking/cmake_install.cmake")
  include("/home/asber/catkin_ws/src/pcl/build/ml/cmake_install.cmake")
  include("/home/asber/catkin_ws/src/pcl/build/geometry/cmake_install.cmake")
  include("/home/asber/catkin_ws/src/pcl/build/visualization/cmake_install.cmake")
  include("/home/asber/catkin_ws/src/pcl/build/segmentation/cmake_install.cmake")
  include("/home/asber/catkin_ws/src/pcl/build/surface/cmake_install.cmake")
  include("/home/asber/catkin_ws/src/pcl/build/registration/cmake_install.cmake")
  include("/home/asber/catkin_ws/src/pcl/build/recognition/cmake_install.cmake")
  include("/home/asber/catkin_ws/src/pcl/build/keypoints/cmake_install.cmake")
  include("/home/asber/catkin_ws/src/pcl/build/tools/cmake_install.cmake")
  include("/home/asber/catkin_ws/src/pcl/build/simulation/cmake_install.cmake")
  include("/home/asber/catkin_ws/src/pcl/build/gpu/cmake_install.cmake")
  include("/home/asber/catkin_ws/src/pcl/build/outofcore/cmake_install.cmake")
  include("/home/asber/catkin_ws/src/pcl/build/stereo/cmake_install.cmake")
  include("/home/asber/catkin_ws/src/pcl/build/examples/cmake_install.cmake")
  include("/home/asber/catkin_ws/src/pcl/build/people/cmake_install.cmake")
  include("/home/asber/catkin_ws/src/pcl/build/test/cmake_install.cmake")
  include("/home/asber/catkin_ws/src/pcl/build/cuda/cmake_install.cmake")
  include("/home/asber/catkin_ws/src/pcl/build/apps/cmake_install.cmake")
  include("/home/asber/catkin_ws/src/pcl/build/doc/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "/home/asber/catkin_ws/src/pcl/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
