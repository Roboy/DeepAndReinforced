#!/usr/bin/env bash
source "${ROS1_ROBOY_WS}/devel/setup.bash"
args=("$@")
roslaunch kindyn robot.launch robot_name:=msj_platform workers:=${args[0]}
