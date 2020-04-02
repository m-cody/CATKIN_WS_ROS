//Mary Cody hw1 pub class
//Jan 29, 2020
#include <ros/ros.h>
#include <std_msgs/String.h>

int main (int argc, char **argv)
{
    ros::init(argc, argv, "hw1_pub");
    ros::NodeHandle nh;

    ros::Publisher pub = nh.advertise<std_msgs::String>("/hw1_topic", 10);
    // 10: outgoing message queue size (required)
    double pub_freq = 1; // defualt freq is 1 Hz
    nh.getParam("hw1_topic_pub_freq", pub_freq);
    ros::Rate rate(pub_freq); //set pub frequency
    std_msgs::String msg_append;
    nh.getParam("hw1_str2", msg_append.data); //retrieve the .launch msg
    
    int i = 0;
    while (ros::ok()) {
        rate.sleep(); // sleep first not to loose the 1st message
        std_msgs::String msg;
        msg.data = "MMMMMMM"; //local message
        msg.data = msg.data + msg_append.data;  //local msg appended with the .launch msg
        pub.publish(msg); 
    }
}
