#include <ros/ros.h>
int main (int argc, char **argv)
{
	ros::init(argc, argv, "hellos_cpp_node"); // unique node name! Cf. annonymous
	ros::NodeHandle nh;
	ROS_INFO("There is something you must know...");
	
	ros::Rate rate(2); // 2 per seconds

	while (ros::ok()) 
	{
		ROS_INFO("I am a pretty unicorn.");
		rate.sleep();
	}
}

