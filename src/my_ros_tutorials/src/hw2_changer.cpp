//Mary Cody hw2 changer class
//Feb 5, 2020
#include <ros/ros.h>
#include <std_msgs/String.h>
#include <my_ros_msgs/hw2.h>

ros::Publisher pub;

void callback_changer(const my_ros_msgs::hw2& msg)
{
    std_msgs::String new_msg;
    new_msg.data = msg.message; //at least need string of same length
    if((int)msg.command ==0)
    {
        pub.publish(new_msg); //no changes needed, so just pub it
    }
    else if((int)msg.command == 1)
    {
        for(int i = 0; i < msg.message.length(); i++)
        {
            new_msg.data[i] = toupper(msg.message[i]);
        }
        pub.publish(new_msg); //pub upper message
    }
    else if((int)msg.command == 2)
    {
        for(int i = 0; i < msg.message.length(); i++)
        {
            new_msg.data[i] = msg.message[msg.message.length()-(i+1)];
        } //loops forward through new msg to replace with the origional by looping that backwards
        pub.publish(new_msg); //pub reversed message
    }
    else
    {
        ROS_INFO_STREAM("Error: COMMAND UNKNOWN"); //in case of failure, press F to pay respect
    }
    
}

int main (int argc, char **argv)
{
    ros::init(argc, argv, "hw2_changer");
    ros::NodeHandle nh;


    double pub_freq = 1; // defualt freq is 1 Hz
    nh.getParam("hw2_topic_pub_freq", pub_freq); //recieve pub freq
    ros::Rate rate(pub_freq);

    ros::Subscriber sub = nh.subscribe("/hw2/hw2_topic", 1000, callback_changer); //sub to the origional pub

    pub = nh.advertise<std_msgs::String>("/hw2_topic_changed", 10); //pub to changed topic
    ros::spin();
}
