# Install script for directory: /home/asber/catkin_ws/src/pcl/features

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

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "pcl_features")
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcl_features.so.1.10.0.99"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcl_features.so.1.10"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcl_features.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "/usr/local/lib")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/asber/catkin_ws/src/pcl/build/lib/libpcl_features.so.1.10.0.99"
    "/home/asber/catkin_ws/src/pcl/build/lib/libpcl_features.so.1.10"
    "/home/asber/catkin_ws/src/pcl/build/lib/libpcl_features.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcl_features.so.1.10.0.99"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcl_features.so.1.10"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcl_features.so"
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

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "pcl_features")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/asber/catkin_ws/src/pcl/build/features/pcl_features-1.10.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "pcl_features")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pcl-1.10/pcl/features" TYPE FILE FILES
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/boost.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/eigen.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/board.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/flare.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/brisk_2d.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/cppf.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/cvfh.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/our_cvfh.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/crh.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/don.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/feature.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/fpfh.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/fpfh_omp.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/from_meshes.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/gasd.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/gfpfh.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/integral_image2D.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/integral_image_normal.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/intensity_gradient.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/intensity_spin.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/linear_least_squares_normal.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/moment_invariants.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/moment_of_inertia_estimation.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/multiscale_feature_persistence.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/narf.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/narf_descriptor.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/normal_3d.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/normal_3d_omp.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/normal_based_signature.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/organized_edge_detection.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/pfh.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/pfh_tools.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/pfhrgb.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/ppf.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/ppfrgb.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/shot.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/shot_lrf.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/shot_lrf_omp.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/shot_omp.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/spin_image.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/principal_curvatures.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/rift.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/rops_estimation.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/rsd.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/grsd.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/statistical_multiscale_interest_region_extraction.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/vfh.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/esf.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/3dsc.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/usc.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/boundary.h"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/range_image_border_extractor.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "pcl_features")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pcl-1.10/pcl/features/impl" TYPE FILE FILES
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/board.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/flare.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/brisk_2d.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/cppf.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/cvfh.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/our_cvfh.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/crh.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/don.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/feature.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/fpfh.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/fpfh_omp.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/gasd.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/gfpfh.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/integral_image2D.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/integral_image_normal.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/intensity_gradient.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/intensity_spin.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/linear_least_squares_normal.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/moment_invariants.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/moment_of_inertia_estimation.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/multiscale_feature_persistence.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/narf.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/normal_3d.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/normal_3d_omp.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/normal_based_signature.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/organized_edge_detection.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/pfh.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/pfhrgb.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/ppf.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/ppfrgb.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/shot.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/shot_lrf.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/shot_lrf_omp.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/shot_omp.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/spin_image.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/principal_curvatures.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/rift.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/rops_estimation.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/rsd.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/grsd.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/statistical_multiscale_interest_region_extraction.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/vfh.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/esf.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/3dsc.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/usc.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/boundary.hpp"
    "/home/asber/catkin_ws/src/pcl/features/include/pcl/features/impl/range_image_border_extractor.hpp"
    )
endif()

