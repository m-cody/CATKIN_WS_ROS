cmake_minimum_required(VERSION 2.8.3)
project(stop_on_white)

add_compile_options(-std=c++11)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  std_msgs
  geometry_msgs

  # ADD {
  cv_bridge
  image_transport
  sensor_msgs
  dynamic_reconfigure
  # }
)

# ADD {
find_package(OpenCV REQUIRED)
generate_dynamic_reconfigure_options(cfg/StopOnWhite.cfg)
# }

catkin_package(
    CATKIN_DEPENDS roscpp
)

include_directories(
  ${catkin_INCLUDE_DIRS}
  # ADD {
  ${dynamic_reconfigure_PACKAGE_PATH}/cmake/cfgbuild.cmake
  ${OpenCV_INCLUDE_DIRS}
  include
  # }
)

# ADD {
add_executable(stop_on_white src/stop_on_white.cpp)
add_dependencies(stop_on_white ${PROJECT_NAME}_gencfg ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(stop_on_white ${catkin_LIBRARIES} ${OpenCV_LIBS})
# }

# Compile prizm control
#add_executable(stop_on_white_node src/stop_on_white.cpp)
#target_link_libraries(stop_on_white_node ${catkin_LIBRARIES} ${OpenCV_LIBS})
