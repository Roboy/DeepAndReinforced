#!/usr/bin/env bash
source "${ROS1_ROBOY_WS}/devel/setup.bash"
roslaunch kindyn robot.launch robot_name:=msj_platform workers:=$1 external_robot_state:=True
