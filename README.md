# Containerization 101: Docker and Beyond – Simplifying Development and Deployment

## Live Example
This repo contains the live example for the study tank session found here: https://www.meetup.com/techtank-to/events/298854685/

Simply follow the instructions below to get started.

### Pre-requisites
- Docker: Download and install docker for your OS from https://www.docker.com/products/docker-desktop/
- Git


### Part 1 - Single stage build
1. Navigate to your working directory and open a terminal. Please ensure the terminal is cd'd to the working directory as well (i.e `cd ./working-directory`).
2. Clone this repo `git clone https://github.com/drunknsorry/hello-world`.
3. cd into hello-world `cd ./hello-world`.
4. The dockerfile is by default setup for a single stage build. To examine the file please open it in your preferred editor (such as VsCode).
5. Lets build it. Run `sudo docker build --rm -t hello-world-stage1 .`
    Lets break down the command.
    - `sudo` is being used primarily for linux and mac since the docker daemon requires root priviledges; atleast for this example. There are ways around this.
    - `docker build` is instructing docker to build using the dockerfile.
    - `--rm` is instructing Docker to delete any containers it may create as intermediaris to build this image.
    - `-t hello-world-stage1` is instructing Docker to give the created image an easy to identify tag, in this case hello-world-stage1.
    - `.` is indicating to Docker that ay required files such as the dockerfile is in the current folder.
6. Once built check if the image exists by running `sudo docker image ls`. This will output a list of images and hello-world-stage1 should be in the list with a size of 896MB.
7. Lets run the image in a container `sudo docker run -d -p 4000:4000 hello-world-stage1:latest`.
    - `-d` is instructing docker to run the container in the background and not dependent on the current terminal window.
    - `-p 4000:4000` is instructing Docker to map port 4000 on your host to port 4000 in the container.
    - We add `:latest` at the end of the tag name to fetch the most current version. You can use this to fetch older versions as needed if multiple images exist.
8. Run `sudo docker ps` and your container should show up since it's running. Browse to https://localhost:4000 and your server should be running.
9. Let's stop the container `sudo docker stop hello-world-stage1`. Now run `sudo docker ps` and the list should be empty since no containers are running.

### Part 2 - Multi stage build
1. Make sure you're in the working directory from part 1 on your terminal.
2. In your preferred editor open the dockerfile and follow the instructions within the file to set it up for a multi stage build.
3. Lets build it. Run `sudo docker build --rm -t hello-world .` 
4. Once built check if the image exists by running `sudo docker image ls`. This will output a list of images and hello-world should be in the list with a size of 14.3MB. That's a 98% reduction in size between stage 1 and stage 2.
5. Lets run the image in a container `sudo docker run -d -p 4000:4000 hello-world:latest`.
6. Run `sudo docker ps` and your container should show up since it's running. Browse to https://localhost:4000 and your server should be running.
7. Let's stop the container `sudo docker stop hello-world`. Now run `sudo docker ps` and the list should be empty since no containers are running.

And that's it. If you liked my study tank session and want a more in-depth workshop please let me know.