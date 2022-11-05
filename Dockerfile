FROM ubuntu:22.04 

RUN apt-get update -qq
RUN apt-get install -y tzdata
RUN apt-get install -y git lsb-release sudo gnupg
RUN git clone --depth 1 https://github.com/ryuichiueda/ros2_setup_scripts
RUN ./ros2_setup_scripts/setup.bash -xv
SHELL ["/bin/bash", "-c"]
RUN mkdir -p /root/ros2_ws/src && cd /root/ros2_ws && colcon build
RUN source /root/ros2_ws/install/setup.bash && source /root/ros2_ws/install/local_setup.bash
ADD bashrc /root/.bashrc
