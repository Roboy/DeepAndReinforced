#!/usr/bin/env bash
# Launch this file within the Docker container
TRAINING_RESULTS_DIR=$1
NUM_WORKERS=$2

cd /root/DeepAndReinforced/bridge_scripts/
nohup bash launch_simulation.sh ${NUM_WORKERS} &>"${TRAINING_RESULTS_DIR}/sim.log" &


sleep 15
cd /root/DeepAndReinforced/gym-roboy/
source "${ROS2_ROBOY_WS}/install/setup.bash"
nohup python3 -m gym_roboy.train_parallel ${NUM_WORKERS} ${TRAINING_RESULTS_DIR} &>"${TRAINING_RESULTS_DIR}/agent.log" &