#!/usr/bin/env bash
source "${ROS1_ROBOY_WS}/devel/setup.bash"
args=("$@")
for((c=1; c<=${args[0]}; c++))
do
	echo $c
	nohup roslaunch kindyn robot.launch robot_name:=msj_platform workers:=$c &
done
