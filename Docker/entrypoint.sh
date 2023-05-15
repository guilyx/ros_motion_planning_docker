#! /bin/bash

function directory_exists() {
  if [ -d "$1" ]
  then
    return 1
  else 
    return 0
  fi
}

function is_directory_empty() {
  if [ -d "$1" ]
  then
    if [ "$(ls -A $1)" ]; then
      return 1
    else
      return 0
    fi
  else
    return 0
  fi
}

set -e
cat /opt/ros/noetic/setup.bash
source /opt/ros/noetic/setup.bash

if directory_exists "~/workspace"; then
  echo -e "Workspace Ready!"
else
    mkdir ~/workspace
fi

cd ~/workspace
catkin config --init --mkdirs --extend /opt/ros/noetic --merge-devel --cmake-args -DCMAKE_BUILD_TYPE=Release
catkin_make
exec "$@"
 