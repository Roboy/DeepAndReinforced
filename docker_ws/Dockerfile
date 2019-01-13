FROM ubuntu:16.04
FROM osrf/ros:kinetic-desktop-full

# install packages

RUN apt update && \

# vim
apt install -y vim && \

# tmux
apt-get install -y tmux

# CARDSflow
RUN apt install -y ros-kinetic-desktop-full libeigen3-dev libxml2-dev coinor-libipopt-dev \
qtbase5-dev qtdeclarative5-dev qtmultimedia5-dev qml-module-qtquick2 \
qml-module-qtquick-window2 qml-module-qtmultimedia qml-module-qtquick-dialogs \
qml-module-qtquick-controls qml-module-qt-labs-folderlistmodel qml-module-qt-labs-settings \
ros-kinetic-moveit-msgs doxygen swig mscgen ros-kinetic-grid-map ros-kinetic-aruco-detect \
ros-kinetic-controller-interface ros-kinetic-controller-manager \
ros-kinetic-effort-controllers libxml++2.6-dev ros-kinetic-robot-localization libalglib-dev && \ 

mkdir -p ~/catkin_ws/src/CARDSflow && \ 
cd ~/catkin_ws/src/CARDSflow && \ 
git clone --recursive https://github.com/CARDSflow/CARDSflow ~/catkin_ws/src/CARDSflow && \

cd ~/catkin_ws/src/CARDSflow/iDynTree/ && \ 
mkdir build && \ 
cd build && \ 
cmake .. && \ 
make -j9 && \ 
make install && \

cd ~/catkin_ws/src/CARDSflow/qpOASES/ && \
mkdir build && cd build && \
cmake .. && \
make -j9 install

# RUN /bin/bash -c 'source /opt/ros/kinetic/setup.bash' && \
# cd ~/catkin_ws && \
# catkin_make
# # RUN source devel/setup.bash


# # ROS2 install
# FROM node:4-onbuild
# RUN apt-get clean && apt-get update && apt-get install -y locales && \
# locale-gen en_US en_US.UTF-8 && \
# update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && \
# export LANG=en_US.UTF-8 && \

# apt update && apt install -y \
#   build-essential \
#   cmake \
#   git \
#   python3-colcon-common-extensions \
#   python3-pip \
#   python-rosdep \
#   python3-vcstool \
#   wget  && \

# python3 -m pip install -U \
#   argcomplete \
#   flake8 \
#   flake8-blind-except \
#   flake8-builtins \
#   flake8-class-newline \
#   flake8-comprehensions \
#   flake8-deprecated \
#   flake8-docstrings \
#   flake8-import-order \
#   flake8-quotes \
#   git+https://github.com/lark-parser/lark.git@0.7b \
#   pytest-repeat \
#   pytest-rerunfailures \
#   pytest \
#   pytest-cov \
#   pytest-runner \
#   setuptools  && \

# apt install --no-install-recommends -y \
#   libasio-dev \
#   libtinyxml2-dev

# RUN mkdir -p ~/ros2_install/src && \
# cd ~/ros2_install && \
# wget https://raw.githubusercontent.com/ros2/ros2/bouncy/ros2.repos wget  && \
# vcs import src < ros2.repos

# RUN rm -f /etc/ros/rosdep/sources.list.d/20-default.list && \
# rosdep init && \
# rosdep update && \
# rosdep install --from-paths src --ignore-src --rosdistro crystal -y --skip-keys "console_bridge fastcdr fastrtps libopensplice67 libopensplice69 python3-lark-parser rti-connext-dds-5.3.1 urdfdom_headers" && \
# cd ~/ros2_install/ && \
# MAKEFLAGS=-j1 && \
# colcon build --symlink-install --packages-skip ros1_bridge && \
# # any package, which hasn't not been installed:
# colcon build --symlink-install --packages-skip ros1_bridge && \