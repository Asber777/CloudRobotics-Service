# Install script for directory: /home/asber/catkin_ws/src/pcl/recognition

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

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "pcl_recognition")
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcl_recognition.so.1.10.0.99"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcl_recognition.so.1.10"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcl_recognition.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "/usr/local/lib:/usr/lib/openmpi/lib")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/asber/catkin_ws/src/pcl/build/lib/libpcl_recognition.so.1.10.0.99"
    "/home/asber/catkin_ws/src/pcl/build/lib/libpcl_recognition.so.1.10"
    "/home/asber/catkin_ws/src/pcl/build/lib/libpcl_recognition.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcl_recognition.so.1.10.0.99"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcl_recognition.so.1.10"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcl_recognition.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHANGE
           FILE "${file}"
           OLD_RPATH "/home/asber/catkin_ws/src/pcl/build/lib:/usr/lib/openmpi/lib:"
           NEW_RPATH "/usr/local/lib:/usr/lib/openmpi/lib")
      if(CMAKE_INSTALL_DO_STRIP)
        execute_process(COMMAND "/usr/bin/strip" "${file}")
      endif()
    endif()
  endforeach()
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "pcl_recognition")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/asber/catkin_ws/src/pcl/build/recognition/pcl_recognition-1.10.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "pcl_recognition")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pcl-1.10/pcl/recognition" TYPE FILE FILES
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/boost.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/color_gradient_dot_modality.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/color_gradient_modality.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/color_modality.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/crh_alignment.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/linemod.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/dotmod.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/quantizable_modality.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/quantized_map.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/dot_modality.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/region_xy.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/mask_map.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/point_types.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/distance_map.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/dense_quantized_multi_mod_template.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/sparse_quantized_multi_mod_template.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/surface_normal_modality.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/linemod/line_rgbd.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/implicit_shape_model.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/ransac_based/auxiliary.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/ransac_based/hypothesis.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/ransac_based/model_library.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/ransac_based/rigid_transform_space.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/ransac_based/obj_rec_ransac.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/ransac_based/orr_graph.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/ransac_based/orr_octree_zprojection.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/ransac_based/trimmed_icp.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/ransac_based/orr_octree.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/ransac_based/simple_octree.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/ransac_based/voxel_structure.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/ransac_based/bvh.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "pcl_recognition")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pcl-1.10/pcl/recognition/ransac_based" TYPE FILE FILES
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/ransac_based/auxiliary.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/ransac_based/hypothesis.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/ransac_based/model_library.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/ransac_based/rigid_transform_space.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/ransac_based/obj_rec_ransac.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/ransac_based/orr_graph.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/ransac_based/orr_octree_zprojection.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/ransac_based/trimmed_icp.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/ransac_based/orr_octree.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/ransac_based/simple_octree.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/ransac_based/voxel_structure.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/ransac_based/bvh.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "pcl_recognition")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pcl-1.10/pcl/recognition/hv" TYPE FILE FILES
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/hv/occlusion_reasoning.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/hv/hypotheses_verification.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/hv/hv_papazov.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/hv/hv_go.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/hv/greedy_verification.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "pcl_recognition")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pcl-1.10/pcl/recognition/cg" TYPE FILE FILES
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/cg/correspondence_grouping.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/cg/hough_3d.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/cg/geometric_consistency.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "pcl_recognition")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pcl-1.10/pcl/recognition/face_detection" TYPE FILE FILES
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/face_detection/face_common.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/face_detection/face_detector_data_provider.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/face_detection/rf_face_detector_trainer.h"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/face_detection/rf_face_utils.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "pcl_recognition")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pcl-1.10/pcl/recognition/impl" TYPE FILE FILES
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/impl/linemod/line_rgbd.hpp"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/impl/ransac_based/simple_octree.hpp"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/impl/ransac_based/voxel_structure.hpp"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/impl/implicit_shape_model.hpp"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "pcl_recognition")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pcl-1.10/pcl/recognition/impl/ransac_based" TYPE FILE FILES
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/impl/ransac_based/simple_octree.hpp"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/impl/ransac_based/voxel_structure.hpp"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "pcl_recognition")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pcl-1.10/pcl/recognition/impl/hv" TYPE FILE FILES
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/impl/hv/occlusion_reasoning.hpp"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/impl/hv/hv_papazov.hpp"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/impl/hv/greedy_verification.hpp"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/impl/hv/hv_go.hpp"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "pcl_recognition")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pcl-1.10/pcl/recognition/impl/cg" TYPE FILE FILES
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/impl/cg/correspondence_grouping.hpp"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/impl/cg/hough_3d.hpp"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/impl/cg/geometric_consistency.hpp"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "pcl_recognition")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pcl-1.10/pcl/recognition/linemod" TYPE FILE FILES "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/linemod/line_rgbd.h")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "pcl_recognition")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pcl-1.10/pcl/recognition/impl/linemod" TYPE FILE FILES "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/impl/linemod/line_rgbd.hpp")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "pcl_recognition")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pcl-1.10/pcl/recognition/3rdparty/metslib" TYPE FILE FILES
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/3rdparty/metslib/abstract-search.hh"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/3rdparty/metslib/local-search.hh"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/3rdparty/metslib/mets.hh"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/3rdparty/metslib/metslib_config.hh"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/3rdparty/metslib/model.hh"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/3rdparty/metslib/observer.hh"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/3rdparty/metslib/simulated-annealing.hh"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/3rdparty/metslib/tabu-search.hh"
    "/home/asber/catkin_ws/src/pcl/recognition/include/pcl/recognition/3rdparty/metslib/termination-criteria.hh"
    )
endif()

