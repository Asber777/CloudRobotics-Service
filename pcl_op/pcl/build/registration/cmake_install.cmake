# Install script for directory: /home/asber/catkin_ws/src/pcl/registration

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

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "pcl_registration")
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcl_registration.so.1.10.0.99"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcl_registration.so.1.10"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcl_registration.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "/usr/local/lib")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/asber/catkin_ws/src/pcl/build/lib/libpcl_registration.so.1.10.0.99"
    "/home/asber/catkin_ws/src/pcl/build/lib/libpcl_registration.so.1.10"
    "/home/asber/catkin_ws/src/pcl/build/lib/libpcl_registration.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcl_registration.so.1.10.0.99"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcl_registration.so.1.10"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcl_registration.so"
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

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "pcl_registration")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/asber/catkin_ws/src/pcl/build/registration/pcl_registration-1.10.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "pcl_registration")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pcl-1.10/pcl/registration" TYPE FILE FILES
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/eigen.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/boost.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/boost_graph.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/convergence_criteria.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/default_convergence_criteria.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/correspondence_estimation.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/correspondence_estimation_normal_shooting.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/correspondence_estimation_backprojection.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/correspondence_estimation_organized_projection.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/correspondence_rejection.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/correspondence_rejection_distance.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/correspondence_rejection_median_distance.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/correspondence_rejection_surface_normal.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/correspondence_rejection_features.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/correspondence_rejection_one_to_one.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/correspondence_rejection_poly.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/correspondence_rejection_sample_consensus.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/correspondence_rejection_sample_consensus_2d.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/correspondence_rejection_trimmed.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/correspondence_rejection_var_trimmed.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/correspondence_rejection_organized_boundary.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/correspondence_sorting.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/correspondence_types.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/ia_ransac.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/icp.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/joint_icp.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/incremental_registration.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/icp_nl.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/lum.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/elch.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/meta_registration.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/ndt.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/ndt_2d.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/ppf_registration.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/pairwise_graph_registration.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/pyramid_feature_matching.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/registration.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/transforms.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/transformation_estimation.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/transformation_estimation_2D.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/transformation_estimation_svd.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/transformation_estimation_svd_scale.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/transformation_estimation_dual_quaternion.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/transformation_estimation_lm.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/transformation_estimation_point_to_plane.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/transformation_estimation_point_to_plane_weighted.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/transformation_estimation_point_to_plane_lls.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/transformation_estimation_point_to_plane_lls_weighted.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/transformation_estimation_symmetric_point_to_plane_lls.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/transformation_validation.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/transformation_validation_euclidean.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/gicp.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/gicp6d.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/bfgs.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/warp_point_rigid.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/warp_point_rigid_6d.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/warp_point_rigid_3d.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/distances.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/exceptions.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/sample_consensus_prerejective.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/ia_fpcs.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/ia_kfpcs.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/matching_candidate.h"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/transformation_estimation_3point.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "pcl_registration")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pcl-1.10/pcl/registration/impl" TYPE FILE FILES
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/default_convergence_criteria.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/correspondence_estimation.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/correspondence_estimation_normal_shooting.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/correspondence_estimation_backprojection.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/correspondence_estimation_organized_projection.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/correspondence_rejection_distance.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/correspondence_rejection_median_distance.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/correspondence_rejection_surface_normal.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/correspondence_rejection_features.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/correspondence_rejection_one_to_one.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/correspondence_rejection_poly.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/correspondence_rejection_sample_consensus.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/correspondence_rejection_sample_consensus_2d.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/correspondence_rejection_trimmed.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/correspondence_rejection_var_trimmed.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/correspondence_rejection_organized_boundary.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/correspondence_types.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/ia_ransac.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/icp.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/joint_icp.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/incremental_registration.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/icp_nl.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/elch.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/lum.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/meta_registration.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/ndt.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/ndt_2d.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/ppf_registration.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/pyramid_feature_matching.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/registration.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/transformation_estimation_2D.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/transformation_estimation_svd.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/transformation_estimation_svd_scale.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/transformation_estimation_dual_quaternion.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/transformation_estimation_lm.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/transformation_estimation_point_to_plane_lls.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/transformation_estimation_point_to_plane_lls_weighted.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/transformation_estimation_point_to_plane_weighted.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/transformation_estimation_symmetric_point_to_plane_lls.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/transformation_validation_euclidean.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/gicp.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/sample_consensus_prerejective.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/ia_fpcs.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/ia_kfpcs.hpp"
    "/home/asber/catkin_ws/src/pcl/registration/include/pcl/registration/impl/transformation_estimation_3point.hpp"
    )
endif()

