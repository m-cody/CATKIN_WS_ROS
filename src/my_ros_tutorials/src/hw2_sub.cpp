//Mary Cody hw2 sub class
//Feb 5, 2020
#include <ros/ros.h>
#include <std_msgs/String.h>

void callback_receive_msg(const std_msgs::String& msg)
{ 
    ROS_INFO_STREAM("Message received: " << msg.data); //prints the final msg
}

int main (int argc, char **argv)
{
    ros::init(argc, argv, "hw2_sub");
    ros::NodeHandle nh;
    ros::Subscriber sub = nh.subscribe("/hw2_topic_changed", 1000, callback_receive_msg);
                          //subed to the changed topic
    ros::spin();
}

