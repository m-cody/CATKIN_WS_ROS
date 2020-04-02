//ROS hw0 by Mary Cody
//22/01/2020
#include <ros/ros.h>
#include <std_msgs/String.h>

int main(int argc, char **argv)
{
	ros::init(argc, argv, "hw0_string");
	ros::NodeHandle nh;
	ROS_INFO("hw0_string node has been started"); //informs user the program is running
	std_msgs::String msg;
	msg.data = "Mary Cody"; //my message
	ROS_INFO_STREAM("My message is: " << msg.data);
	ROS_INFO_STREAM("The length of the message is: " << msg.data.length());
	ROS_INFO_STREAM("The 3rd char in the message is: " << msg.data[2]);
	ROS_INFO_STREAM("The last leter in the message is: " << msg.data[msg.data.length()-1]);
	
	std_msgs::String temp; //temp string for storing transformations
	temp.data = msg.data; //sets the strigns to be same, so they are the same length
	
	//loop to create upper string
	for (int i = 0; i < msg.data.length(); i++)
	{
		temp.data[i] = toupper(msg.data[i]); //setting the letters to upper one at a time
	}
	msg.data = temp.data; //sets the origional string to the upper string
	ROS_INFO_STREAM("The message to upper is: " << msg.data);


	//loop to reverse the upper string
	for (int i = 0; i < msg.data.length(); i++)
	{
		temp.data[i] = msg.data[msg.data.length()-(i+1)];
		//sets the temp string to letters by going backwards through the origional
		//since i starts at 0, it is added to 1 before subtracting from the string length
	}
	msg.data = temp.data; //sets the origional to the reversed string
	ROS_INFO_STREAM("The message reveresed is: " << msg.data);
}

