# install ROS1 kinetic full
FROM osrf/ros:kinetic-desktop-full

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


## download DeepAndReinforced repository from git
mkdir -p ~/tmp_cloning && \
git clone https://github.com/Roboy/DeepAndReinforced.git ~/tmp_cloning/DeepAndReinforced && \
mv -v ~/tmp_cloning/* /root && \
rm -rf ~/tmp_cloning && \
cd ~/DeepAndReinforced && git submodule update --init --recursive && \

## build iDynTree
cd ~/DeepAndReinforced/ROS1_ROBOY_WS/src/CARDSflow/iDynTree/ && \
mkdir build && \
cd build && \
cmake .. && \
make -j9 && \
make install && \

## build qpOASES
cd ~/DeepAndReinforced/ROS1_ROBOY_WS/src/CARDSflow/qpOASES/ && \
mkdir build && cd build && \
cmake .. && \
make -j9 install && \

/bin/bash -c '. /opt/ros/kinetic/setup.bash; cd ~/DeepAndReinforced/ROS1_ROBOY_WS/; catkin_make' && \


## install ROS2
mkdir -p ~/DeepAndReinforced/ROS2_INSTALL_WS/src &&\
cd ~/DeepAndReinforced/ROS2_INSTALL_WS &&\
wget https://raw.githubusercontent.com/ros2/ros2/bouncy/ros2.repos &&\
vcs import src < ros2.repos && \
rm -f ~/DeepAndReinforced/ROS2_INSTALL_WS/ros2.repos &&\

rm -f /etc/ros/rosdep/sources.list.d/20-default.list && \
rosdep init && \
rosdep update && \
cd ~/DeepAndReinforced/ROS2_INSTALL_WS && \
rosdep install --from-paths src --ignore-src --rosdistro crystal -y --skip-keys "console_bridge fastcdr fastrtps libopensplice67 libopensplice69 python3-lark-parser rti-connext-dds-5.3.1 urdfdom_headers" && \

cd ~/DeepAndReinforced/ROS2_INSTALL_WS && \
### not sure how to set MAKEFLAGS=-j1
export MAKEFLAGS=-j1 && \
MAKEFLAGS=-j1 && \
pip3 install lz4 && \
colcon build --symlink-install --packages-skip ros1_bridge && \
### recompile in the case that previously errors appeared
colcon build --symlink-install --packages-skip ros1_bridge && \

## compile ROS2 roboy messages
cd ~/DeepAndReinforced/ROS2_ROBOY_WS/ && \
/bin/bash -c '. ~/DeepAndReinforced/ROS2_INSTALL_WS/install/setup.bash; colcon build --symlink-install' && \

# compile ROS1 bridge
/bin/bash -c '. /opt/ros/kinetic/setup.bash; \
	. ~/DeepAndReinforced/ROS2_INSTALL_WS/install/setup.bash; \
	. ~/DeepAndReinforced/ROS1_ROBOY_WS/devel/setup.bash; \
	. ~/DeepAndReinforced/ROS2_ROBOY_WS/install/setup.bash; \
	cd ~/DeepAndReinforced/ROS2_INSTALL_WS; \
	MAKEFLAGS=-j1; \
	export MAKEFLAGS=-j1; \
	colcon build --symlink-install --packages-select ros1_bridge --cmake-force-configure' && \

## recompile ROS1 bridge in the case that previously errors appeared
/bin/bash -c '. /opt/ros/kinetic/setup.bash; \
	. ~/DeepAndReinforced/ROS2_INSTALL_WS/install/setup.bash; \
	. ~/DeepAndReinforced/ROS1_ROBOY_WS/devel/setup.bash; \
	. ~/DeepAndReinforced/ROS2_ROBOY_WS/install/setup.bash; \
	cd ~/DeepAndReinforced/ROS2_INSTALL_WS; \
	MAKEFLAGS=-j1; \
	export MAKEFLAGS=-j1; \
	colcon build --symlink-install --packages-select ros1_bridge --cmake-force-configure' && \


# install OpenAI gym
mkdir -p ~/tmp_cloning && \
git clone https://github.com/openai/gym ~/tmp_cloning/gym && \
mv -v ~/tmp_cloning/* /root && \
rm -rf ~/tmp_cloning && \
cd ~/gym && pip3 install -e . && \


# install stable baselines
apt-get update && apt-get install cmake libopenmpi-dev python3-dev zlib1g-dev && \
pip3 install stable-baselines && \

# install gym-roboy
cd ~/DeepAndReinforced/gym-roboy && pip3 install -e . && \

# install ranger and zsh
apt-get update && \
apt-get -y install ranger caca-utils highlight atool w3m poppler-utils mediainfo \
zsh && \
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)" && \
echo 'source ~/.bashrc' | cat - ~/.zshrc > temp && mv temp ~/.zshrc && \
sed -i 's/robbyrussell/agnoster/g' ~/.zshrc && \

# after all the installation is done, remove trash
rm -rf /var/likb/apt/lists/* && \
rm -rf /var/likb/apt-get/lists/* && \
rm -rf ~/.local/share/Trash


# install some export variables, aliases and great features
RUN echo "export ROS1_WS=/opt/ros/kinetic" >> ~/.bashrc && \
	echo "export ROS1_ROBOY_WS=~/DeepAndReinforced/ROS1_ROBOY_WS" >> ~/.bashrc && \
	echo "export ROS2_ROBOY_WS=~/DeepAndReinforced/ROS2_ROBOY_WS" >> ~/.bashrc && \
	echo "export ROS2_INSTALL_WS=~/DeepAndReinforced/ROS2_INSTALL_WS" >> ~/.bashrc && \
	echo "export CARDSflow=~/DeepAndReinforced/ROS1_ROBOY_WS/src/CARDSflow" >> ~/.bashrc && \

	echo "alias source_ROS1='source /opt/ros/kinetic/setup.bash'">> ~/.bashrc && \
	echo "alias source_ROS1_ROBOY_WS='source ~/DeepAndReinforced/ROS1_ROBOY_WS/devel/setup.bash'" >> ~/.bashrc && \
	echo "alias source_ROS2_ROBOY_WS='source ~/DeepAndReinforced/ROS2_ROBOY_WS/install/setup.bash'" >> ~/.bashrc && \
	echo "alias source_ROS2_INSTALL_WS='source ~/DeepAndReinforced/ROS2_INSTALL_WS/install/setup.bash'" >> ~/.bashrc && \

	# for bash
	echo "alias cd_ROS1_WS='cd /opt/ros/kinetic'" >> ~/.bashrc && \
	echo "alias cd_ROS1_ROBOY_WS='cd ~/DeepAndReinforced/ROS1_ROBOY_WS'" >> ~/.bashrc && \
	echo "alias cd_ROS2_ROBOY_WS='cd ~/DeepAndReinforced/ROS2_ROBOY_WS'" >> ~/.bashrc && \
	echo "alias cd_ROS2_INSTALL_WS='cd ~/DeepAndReinforced/ROS2_INSTALL_WS'" >> ~/.bashrc && \
	echo "alias cd_CARDSflow='cd ~/DeepAndReinforced/ROS1_ROBOY_WS/src/CARDSflow'" >> ~/.bashrc && \

	# for zsh
	echo "alias zsource_ROS1='source /opt/ros/kinetic/setup.zsh'">> ~/.bashrc && \
	echo "alias zsource_ROS1_ROBOY_WS='source ~/DeepAndReinforced/ROS1_ROBOY_WS/devel/setup.zsh'" >> ~/.bashrc && \
	echo "alias zsource_ROS2_ROBOY_WS='source ~/DeepAndReinforced/ROS2_ROBOY_WS/install/setup.zsh'" >> ~/.bashrc && \
	echo "alias zsource_ROS2_INSTALL_WS='source ~/DeepAndReinforced/ROS2_INSTALL_WS/install/setup.zsh'" >> ~/.bashrc && \

	# after each cd command the terminal will execute ll automatically
	echo "alias ll='ls -al'" >> ~/.bashrc && \
	echo 'cd ~\nll\nfunction cd {\n    builtin cd "$@" && ll\n    }' >> ~/.bashrc && \

	# .. is the same as cd ..
	echo "alias ..='cd ..'">> ~/.bashrc
