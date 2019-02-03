#!/usr/bin/env bash
tmux \
new-session "./launch_simulation.sh; exec bash" \; \
split-window -h "/bin/bash -c 'echo \"waiting 12 seconds\"; sleep 12; source /root/DeepAndReinforced/ROS2_ROBOY_WS/install/setup.bash; cd /root/develDeepAndReinforced/gym-roboy; python3 -m gym_roboy.example_control'; exec bash" \; \
split-window -h "/bin/bash -c 'tensorboard --logdir=/root/develDeepAndReinforced/tensorboard_out/'" \; \
select-layout even-horizont