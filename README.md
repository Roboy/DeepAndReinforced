# IDEA
Control tendons of the cable robots to reach commanded position for joint with reinforcement learning. Set up easily integratable tool to enable training any cable robots for goal reach tasks. 

# How to start
- Initialize and update every submodule ```bash git submodule update --init --recursive```.
Double check if you are in the right branch!

Submodule | branch
------------ | -------------
**kindyn** | deepRoboy-feature
**roboy_communication** under ROS2_ROBOY_WS | bouncy
rest of the submodules | master

- Build the [Cardsflow](https://cardsflow.readthedocs.io/en/latest/Usage/0_installation.html)
- install [ROS2 and the ROS1_bridge](https://github.com/Roboy/deep_roboy_contol/tree/66feaca04e8d9f07e15265f782a9962f1420f5e6/simple_robot_state_subscriber)
PS: currently debian packages are not working for the bridge installation.
- Set the environment variables in your ~/.bashrc. For some help on setting env variables you can find it [here](https://help.ubuntu.com/community/EnvironmentVariables)
    - ROS2_INSTALL_WS: your directory where you installed ros2 in previous step.
    - ROS2_ROBOY_WS: use the path of ROS2_ROBOY_WS under this repo
    - ROS1_ROBOY_WS: use the path of ROS1_ROBOY_WS under this repo
- Start the simulation with https://github.com/Roboy/DeepAndReinforced/blob/master/bridge_scripts/launch_simulation.sh
- Start training under gym-roboy repo by typing in terminal:
```bash
cd gym-roboy/
python3 -m gym_roboy.train_parallel num_cpus
```
where `num_cpus` is the number of cpus to use.
# Submodules: What do they do?
  Relevant submodules.
  - **gym-roboy**
    - Implements OPENAI gym environment to train CARDSflow robots uses ROS2 for communication to simulation.For more [info](https://github.com/Roboy/gym-roboy)
  - **CARDSFLOW**
    - This repository provides a full pipeline for Cable Robots from CAD in Autodesk Fusion 360 to full simulation and control of these robots.
  - **Kindyn**
    - this repo contains the core c++ implementation for controlling cable robots. For more [info](https://github.com/CARDSflow/kindyn/tree/deepRoboy-feature)
    - GymFunction class implements the gym services. [Gym Function class](https://github.com/CARDSflow/kindyn/blob/generalizationGym/src/gymFunctions.cpp)
  - **roboy_communicaion**
    - ROS1 communication messages and services are provided in [here](https://github.com/Roboy/roboy_communication/tree/master)
    - ROS2 communication messages and services are provided in [here](https://github.com/Roboy/roboy_communication/tree/bouncy)
    - ros1_bridge enables the communication between reinforcement learning agent which is in ROS2 and simulation robot in ROS1.
  
