#!/usr/bin/env bash

source "${ROS2_INSTALL_WS}/install/setup.bash"

cd ${ROS2_ROBOY_WS}
colcon build --symlink-install