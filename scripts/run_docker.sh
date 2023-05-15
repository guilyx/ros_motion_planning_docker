#!/bin/bash

source ~/.bashrc

xhost +

RMP_PATH=""

VERBOSE=0
CLEAR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'

DOCKER_BASE_CMD="docker run -i -t --rm \
--privileged=True \
--net=host \
--env DISPLAY=${DISPLAY} \
--env='QT_X11_NO_MITSHM=1' \
-e 'TERM=xterm-256color' \
--env NVIDIA_DISABLE_REQUIRE=1 \
--env NVIDIA_VISIBLE_DEVICES=0 \
--env NVIDIA_DRIVER_CAPABILITIES=all "

# CLI Helper
function show_help() {
  if [ -n "$1" ]; then
    echo -e "${RED}👉 $1${CLEAR}\n";
  fi

  echo "Usage: $0 [-ws my-workspace] [-o option1] [-o option2] ..."
  echo "  -h,  --help              Shows help"
  echo "  -p,  --path              Absolute local path to the ros_motion_planning repository"
  echo ""
  echo "Example: $0"
  echo "Example: $0 -p /home/johndoe/ros_motion_planning_docker/ros_motion_planning"
  exit 1
}

# Arg Parsing
while [[ "$#" > 0 ]]; do case $1 in

  -p|--path) RMP_PATH=$2; shift;shift;;
  -v|--verbose) VERBOSE=1;shift;;
  -h|--help) show_help;;
  *) show_help "Unknown parameter passed: $1"; shift; shift;;

esac; done

if [[ $RMP_PATH == "" ]]; then
  show_help "No PATH to ros_motion_planning passed."
fi

echo ""
echo "Running Docker..."
echo ""

DOCKER_ARGS="--volume=${RMP_PATH}:/home/rmp-dev/workspace/src/ros_motion_planning:rw \
--volume=${WORKSPACE}/swarm_simulation/Docker/startup.sh:/home/tii/startup.sh \
--entrypoint /home/rmp-dev/entrypoint.sh \
rmp_docker /bin/bash"

echo "${DOCKER_BASE_CMD}${DOCKER_ARGS}"
eval "${DOCKER_BASE_CMD}${DOCKER_ARGS}"