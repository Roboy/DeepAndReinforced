#!/usr/bin/env bash
source /opt/ros/kinetic/setup.bash
source "${ROS2_INSTALL_WS}/install/setup.bash"
source "${ROS1_ROBOY_WS}/devel/setup.bash"
source "${ROS2_ROBOY_WS}/install/setup.bash"

ros2 run ros1_bridge dynamic_bridge
