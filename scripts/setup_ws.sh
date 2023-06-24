#!/bin/bash

function setup(){    
    # donwload and build microros
    git clone -b humble https://github.com/micro-ROS/micro-ROS-Agent.git src/micro-ROS-Agent
    # sudo rosdep init
    rosdep update && rosdep install --from-paths src --ignore-src -y
    colcon build
    source install/local_setup.bash
    # get microros agent ref file from ap
    wget https://github.com/ArduPilot/ardupilot/blob/master/libraries/AP_DDS/dds_xrce_pr src/
}

setup | tee setup_ws.log