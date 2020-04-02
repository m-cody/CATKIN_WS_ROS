//Mary Cody
//Feb 5, 2020
#include <ros/ros.h>
#include <std_msgs/Int32.h>
#include <std_msgs/Bool.h>

std_msgs::Bool led_state;
ros::Publisher led_pub;


void send_state(const std_msgs::Int32& msg) //sends desired state form keyboard
{
    if (msg.data == 49){
        led_state.data = true;
    }
    else if(msg.data == 48){
        led_state.data = false;
    }
    led_pub.publish(led_state);
}


int main(int argc, char** argv)
{
    ros::init(argc, argv, "prizm_led_sim");
    ros::NodeHandle nh;

    ros::Subscriber sub = nh.subscribe("/keyboard", 1000, send_state);
    
    int led_color = 0; //sets default to 0;
    nh.getParam("led_color", led_color);
    if(led_color == 2){ //picks which led based on launch file
        led_pub = nh.advertise<std_msgs::Bool>("/green_led", 10);
    }
    else if(led_color ==3){
       led_pub = nh.advertise<std_msgs::Bool>("/red_led", 10);
    }



    ros::spin();
}
