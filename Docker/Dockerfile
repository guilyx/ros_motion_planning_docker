FROM osrf/ros:noetic-desktop-full

WORKDIR /home/rmp-dev
ENV HOME=/home/rmp-dev
COPY entrypoint.sh /home/rmp-dev/.

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install apt-utils -y 
RUN apt-get install neovim -y 
RUN apt-get install build-essential -y
RUN apt-get install python3 python python3-pip -y
RUN apt-get install python-is-python3 -y
RUN apt-get install ros-noetic-amcl -y
RUN apt-get install ros-noetic-base-local-planner -y
RUN apt-get install ros-noetic-map-server -y
RUN apt-get install ros-noetic-move-base -y
RUN apt-get install ros-noetic-navfn -y
RUN pip install catkin-tools

RUN echo "source /opt/ros/noetic/setup.bash" >> /root/.bashrc 

