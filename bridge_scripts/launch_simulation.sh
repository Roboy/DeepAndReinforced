#!/usr/bin/env bash

env_variables_are_set() {
    : "${ROS2_INSTALL_WS:?Environment variable 'ROS2_INSTALL_WS' is not set}"
    : "${ROS2_ROBOY_WS:?Environment variable 'ROS2_ROBOY_WS' is not set}"
    : "${ROS1_ROBOY_WS:?Environment variable 'ROS1_ROBOY_WS' is not set}"
}

env_variables_are_set
args=($@)

echo ${args[0]}

bash "./init_cardsflow.sh" ${args[0]}&
sleep 3s
bash "./init_bridge.sh"
