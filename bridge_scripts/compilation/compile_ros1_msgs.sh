#!/usr/bin/env bash

source /opt/ros/kinetic/setup.bash
cd ${ROS1_ROBOY_WS}
export MAKEFLAGS=-j1
catkin_make
