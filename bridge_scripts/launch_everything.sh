#!/usr/bin/env bash

GYM_ROBOY_DIR=/root/DeepAndReinforced/gym-roboy
TRAINING_RESULTS_DIR="${GYM_ROBOY_DIR}/training_results/"

tmux \
new-session "./launch_simulation.sh; exec bash" \; \
split-window -h "/bin/bash -c 'echo \"waiting 12 seconds\"; sleep 12; source ${ROS2_ROBOY_WS}/install/setup.bash; cd ${GYM_ROBOY_DIR}; python3 -m gym_roboy.example_control'; exec bash" \; \
split-window -h "/bin/bash -c 'tensorboard --logdir=${TRAINING_RESULTS_DIR}'" \; \
select-layout even-horizont