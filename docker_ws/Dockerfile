# install ROS1 kinetic base
FROM ros:kinetic-ros-base

# in order to avoid the error: debconf: unable to initialize frontend: Dialog
# https://github.com/phusion/baseimage-docker/issues/58
ENV DEBIAN_FRONTEND noninteractive

# install packages
RUN apt update && \

## apt-utils
apt-get install -y --no-install-recommends apt-utils && \

## vim
apt install -y vim && \

## tmux
apt-get install -y tmux && \


# download ROS1_WS, ROS2_WS and CARDSflow from git and compile the files

## CARDSflow needs these packages
apt install -y ros-kinetic-desktop-full libeigen3-dev libxml2-dev coinor-libipopt-dev \
qtbase5-dev qtdeclarative5-dev qtmultimedia5-dev qml-module-qtquick2 \
qml-module-qtquick-window2 qml-module-qtmultimedia qml-module-qtquick-dialogs \
qml-module-qtquick-controls qml-module-qt-labs-folderlistmodel qml-module-qt-labs-settings \
ros-kinetic-moveit-msgs doxygen swig mscgen ros-kinetic-grid-map ros-kinetic-aruco-detect \
ros-kinetic-controller-interface ros-kinetic-controller-manager \
ros-kinetic-effort-controllers libxml++2.6-dev ros-kinetic-robot-localization libalglib-dev && \

## ROS2 needs these packages
apt-get clean && apt-get update && apt-get install -y locales && \
locale-gen en_US en_US.UTF-8 && \
update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8 && \
export LANG=en_US.UTF-8 && \

apt update && apt install -y \
  build-essential \
  cmake \
  git \
  python3-colcon-common-extensions \
  python3-pip \
  python-rosdep \
  python3-vcstool \
  wget  && \

python3 -m pip install -U \
  argcomplete \
  flake8 \
  flake8-blind-except \
  flake8-builtins \
  flake8-class-newline \
  flake8-comprehensions \
  flake8-deprecated \
  flake8-docstrings \
  flake8-import-order \
  flake8-quotes \
  git+https://github.com/lark-parser/lark.git@0.7b \
  pytest-repeat \
  pytest-rerunfailures \
  pytest \
  pytest-cov \
  pytest-runner \
  setuptools && \

apt install --no-install-recommends -y \
  libasio-dev \
  libtinyxml2-dev && \

rm -rf /var/likb/apt/lists/* && \

## download DeepAndReinforced repository from git
mkdir -p ~/tmp_cloning && \
git clone https://github.com/Roboy/DeepAndReinforced.git ~/tmp_cloning/DeepAndReinforced && \
mv -v ~/tmp_cloning/* /root && \
rm -rf ~/tmp_cloning && \
cd ~/DeepAndReinforced && git submodule update --init --recursive && \ 

## build iDynTree
cd ~/DeepAndReinforced/ROS1_WS/src/CARDSflow/iDynTree/ && \ 
mkdir build && \ 
cd build && \ 
cmake .. && \ 
make -j9 && \ 
make install && \

## build qpOASES
cd ~/DeepAndReinforced/ROS1_WS/src/CARDSflow/qpOASES/ && \
mkdir build && cd build && \
cmake .. && \
make -j9 install
