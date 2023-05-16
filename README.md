# ROS Motion Planning Docker 🐳

...A Development Docker for the [https://github.com/ai-winter/ros_motion_planning](ros_motion_planning) repository...

### Brief

This is a docker that will use a symbolic link for you to do your development in your machine, and build/run/test in the Docker. Simplifies the installation/setup of the project using a container, easily push your tested changes from your local machine.

### Setup the Project

- Clone the Repository:

```bash
git clone git@github.com:guilyx/ros_motion_planning_docker.git
```

- Clone your Fork inside the repository:

```bash
cd ros_motion_planning_docker
git clone git@github.com:{username}/ros_motion_planning.git
```

- Build the Docker:

```bash
cd Docker/
docker build -t rmp_docker .
```

- Execute the Docker:

```bash
cd scripts/
./run_docker.sh -p {absolute path to ros_motion_planning}
```

### Build the Packages

- In the Docker:

```bash
cd ~/workspace
catkin_make
```

### Run the Simulation

- In the Docker:

```bash
. ~/workspace/devel/setup.bash
cd ~/workspace/src/ros_motion_planning/src/sim_env/scripts
./main.sh
```
