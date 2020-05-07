// ROS Includes
#include <ros/ros.h>
#include <cmath>
#include <sensor_msgs/NavSatFix.h>
#include <std_msgs/Header.h>

#include <cmath>

sensor_msgs::NavSatFix current_msg;
sensor_msgs::NavSatFix prev_msg;

// Return the distance in meters between two gps points
// This value is approximate
double haversine(double lat1, double long1, double lat2, double long2)
{
    static const double d2r = (M_PI / 180.0);
    static const double earth_rad_km = 6367.0;

    double dlong = (long2 - long1) * d2r;
    double dlat = (lat2 - lat1) * d2r;
    double a = pow(sin(dlat/2.0), 2) + cos(lat1*d2r) * cos(lat2*d2r) * pow(sin(dlong/2.0), 2);
    double c = 2 * atan2(sqrt(a), sqrt(1-a));
    double d = earth_rad_km * c;

    // Convert to meters
    return d * 1000.0;
}

void gpsCallback(const sensor_msgs::NavSatFix& msg)
{
    current_msg = msg;
    double speed = 0.0;

    /** YOUR CODE HERE **/
    // Compute time and distance between previous two ros messages
    // prev_msg and current_msg

    ROS_INFO_STREAM("The speed is " << speed << " m/s");
    prev_msg = current_msg;
}


int main(int argc, char **argv)
{
    // Set up ROS
    ros::init(argc, argv, "speedometer");
    ros::NodeHandle nh{"~"};
    ros::Subscriber sub = nh.subscribe("/fix", 10, &gpsCallback);
    ros::spin();

    return 0;
}
