#!/usr/bin/env bash

source "${ROS2_INSTALL_WS}/install/setup.bash"

cd ${ROS2_ROBOY_WS}
export MAKEFLAGS=-j1
colcon build --symlink-install
