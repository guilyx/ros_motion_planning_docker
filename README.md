# ros_motion_planning_docker

🐳 Development Docker for the ros_motion_planning repo

### What is it ?

This is a docker that will use a symbolic link for you to do your development in your machine, and build/run/test in the Docker. Simplifies the installation/setup of the project using a container, easily push your tested changes from your local machine.

### How To

- Setup the Project:

```
git clone git@github.com:guilyx/ros_motion_planning_docker.git
cd ros_motion_planning_docker
```

- Clone your Fork inside the repository: `git clone git@github.com:{username}/ros_motion_planning.git`

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
