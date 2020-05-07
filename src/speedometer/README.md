# HW11: Speedometer

### 1. Install `ros_web_map`

Install [`ros_web_map`](https://github.com/LTU-AutoEV/ros_web_map) from source


### 2. Launch the map

```
roslaunch ros_web_map map.launch
```


### 3. Play the rosbag

```
rosbag play --loop <<bagname>>.bag
```

### 4. Speedometer

Add code to speedometer.cpp to calculate your approximate speed. You will need to initialize ROS and create a subscriber. 

The GPS publishes a topic of type [`sensor_msgs/NavSatFix`](http://docs.ros.org/melodic/api/sensor_msgs/html/msg/NavSatFix.html)

To calculate your speed, take the distance between the previous two GPS points and divide the result by the time difference between the two messages.

Time between two ros messages:

```c++
ros::Time prev_time = prev_msg.header.stamp;
ros::Duration dt = current_msg.header.stamp - prev_time;
double secs = dt.toSec();
```

More info:

  - [Calculating the time between two ros messages](https://answers.ros.org/question/229445/how-can-i-get-time-difference-of-two-messages-published-by-same-publisher-on-same-topic/)
