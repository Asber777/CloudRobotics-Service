# Install script for directory: /home/asber/catkin_ws/src/pcl/surface

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

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "pcl_surface")
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcl_surface.so.1.10.0.99"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcl_surface.so.1.10"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcl_surface.so"
      )
    if(EXISTS "${file}" AND
       NOT IS_SYMLINK "${file}")
      file(RPATH_CHECK
           FILE "${file}"
           RPATH "/usr/local/lib:/usr/lib/openmpi/lib")
    endif()
  endforeach()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE SHARED_LIBRARY FILES
    "/home/asber/catkin_ws/src/pcl/build/lib/libpcl_surface.so.1.10.0.99"
    "/home/asber/catkin_ws/src/pcl/build/lib/libpcl_surface.so.1.10"
    "/home/asber/catkin_ws/src/pcl/build/lib/libpcl_surface.so"
    )
  foreach(file
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcl_surface.so.1.10.0.99"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcl_surface.so.1.10"
      "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libpcl_surface.so"
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

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "pcl_surface")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/asber/catkin_ws/src/pcl/build/surface/pcl_surface-1.10.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "pcl_surface")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pcl-1.10/pcl/surface" TYPE FILE FILES
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/boost.h"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/eigen.h"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/ear_clipping.h"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/gp3.h"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/grid_projection.h"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/marching_cubes.h"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/marching_cubes_hoppe.h"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/marching_cubes_rbf.h"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/bilateral_upsampling.h"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/mls.h"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/organized_fast_mesh.h"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/reconstruction.h"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/processing.h"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/simplification_remove_unused_vertices.h"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/surfel_smoothing.h"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/texture_mapping.h"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/poisson.h"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/concave_hull.h"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/convex_hull.h"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/qhull.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "pcl_surface")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pcl-1.10/pcl/surface/3rdparty/poisson4" TYPE FILE FILES
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/3rdparty/poisson4/allocator.h"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/3rdparty/poisson4/binary_node.h"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/3rdparty/poisson4/bspline_data.h"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/3rdparty/poisson4/factor.h"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/3rdparty/poisson4/function_data.h"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/3rdparty/poisson4/geometry.h"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/3rdparty/poisson4/marching_cubes_poisson.h"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/3rdparty/poisson4/mat.h"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/3rdparty/poisson4/multi_grid_octree_data.h"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/3rdparty/poisson4/octree_poisson.h"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/3rdparty/poisson4/polynomial.h"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/3rdparty/poisson4/ppolynomial.h"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/3rdparty/poisson4/sparse_matrix.h"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/3rdparty/poisson4/vector.h"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/3rdparty/poisson4/bspline_data.hpp"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/3rdparty/poisson4/function_data.hpp"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/3rdparty/poisson4/geometry.hpp"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/3rdparty/poisson4/mat.hpp"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/3rdparty/poisson4/multi_grid_octree_data.hpp"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/3rdparty/poisson4/octree_poisson.hpp"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/3rdparty/poisson4/polynomial.hpp"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/3rdparty/poisson4/ppolynomial.hpp"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/3rdparty/poisson4/sparse_matrix.hpp"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/3rdparty/poisson4/vector.hpp"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/3rdparty/poisson4/poisson_exceptions.h"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "pcl_surface")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/pcl-1.10/pcl/surface/impl" TYPE FILE FILES
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/impl/gp3.hpp"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/impl/grid_projection.hpp"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/impl/marching_cubes.hpp"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/impl/marching_cubes_hoppe.hpp"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/impl/marching_cubes_rbf.hpp"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/impl/bilateral_upsampling.hpp"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/impl/mls.hpp"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/impl/organized_fast_mesh.hpp"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/impl/reconstruction.hpp"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/impl/processing.hpp"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/impl/surfel_smoothing.hpp"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/impl/texture_mapping.hpp"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/impl/poisson.hpp"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/impl/concave_hull.hpp"
    "/home/asber/catkin_ws/src/pcl/surface/include/pcl/surface/impl/convex_hull.hpp"
    )
endif()

