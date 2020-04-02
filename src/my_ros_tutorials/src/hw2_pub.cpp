//Mary Cody hw2 pub class
//Feb 5, 2020
#include <ros/ros.h>
#include <std_msgs/String.h>
#include <my_ros_msgs/hw2.h>

int main (int argc, char **argv)
{
    ros::init(argc, argv, "hw2_pub");
    ros::NodeHandle nh;

    ros::Publisher pub = nh.advertise<my_ros_msgs::hw2>("/hw2/hw2_topic", 10);
    // 10: outgoing message queue size (required)
    double pub_freq = 1; // defualt freq is 1 Hz
    nh.getParam("hw2_topic_pub_freq", pub_freq);
    ros::Rate rate(pub_freq); //set pub frequency
    
    srand(time(NULL)); //initiate randon num gen so not constrained by time

    int i = 0;
    while (ros::ok()) {
        rate.sleep(); // sleep first not to loose the 1st message
        my_ros_msgs::hw2 msg;
        msg.command = rand() % 3; //gives random command
        msg.message = "mcody"; //local message
        pub.publish(msg); 
    }
}
