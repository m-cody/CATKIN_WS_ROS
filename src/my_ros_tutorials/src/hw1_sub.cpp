//Mary Cody hw1 sub class
//Jan 29, 2020
#include <ros/ros.h>
#include <std_msgs/String.h>

void callback_receive_msg(const std_msgs::String& msg)
{ 
    ROS_INFO_STREAM("Message received: " << msg.data); //prints the final msg
}

int main (int argc, char **argv)
{
    ros::init(argc, argv, "hw1_sub");
    ros::NodeHandle nh;
    ros::Subscriber sub = nh.subscribe("/hw1_topic_changed", 1000, 
                          callback_receive_msg);
                          //subed to the changed topic
    ros::spin();
}

