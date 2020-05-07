cmake_minimum_required(VERSION 2.8.3)
project(speedometer)

## Compile as C++11, supported in ROS Kinetic and newer
add_compile_options(-std=c++11)

find_package(catkin REQUIRED COMPONENTS roscpp rospy std_msgs)

catkin_package()

include_directories( ${catkin_INCLUDE_DIRS})

add_executable(speedometer src/speedometer.cpp)
add_dependencies(speedometer ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})

target_link_libraries(speedometer
    ${catkin_LIBRARIES}
)
