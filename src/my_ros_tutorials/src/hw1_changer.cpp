//Mary Cody hw1 changer class
//Jan 29, 2020
#include <ros/ros.h>
#include <std_msgs/String.h>

ros::Publisher pub;

void callback_changer(const std_msgs::String& msg)
{
    int change = rand() % msg.data.length(); //use length of msg to create a valid char location
    std_msgs::String new_msg;
    new_msg.data = msg.data; //need to be able to change the msg
    new_msg.data[change] = ' '; //change the char from random location to blank

    pub.publish(new_msg); //pub message to /hw1_changed topic
}

int main (int argc, char **argv)
{
    ros::init(argc, argv, "hw1_changer");
    ros::NodeHandle nh;

    srand(time(NULL)); //initiate randon num gen so not constrained by time

    double pub_freq = 1; // defualt freq is 1 Hz
    nh.getParam("hw1_topic_pub_freq", pub_freq); //recieve pub freq
    ros::Rate rate(pub_freq);

    ros::Subscriber sub = nh.subscribe("/hw1_topic", 1000, callback_changer); //sub to the origional pub

    pub = nh.advertise<std_msgs::String>("/hw1_topic_changed", 10); //pub to changed topic
    ros::spin();
}
