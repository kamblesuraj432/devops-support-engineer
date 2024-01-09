# Docker instructions Below

## Creating docker image from Dockerfile
```bash
# using 'sudo su' is not a good practice.
sudo usermod -aG docker $USER && newgrp docker  # give the permission of current user
sudo docker build -t custom-ubuntu-image .
# -t means tag - given the image name
```

## Check docker Image using below command
```bash
sudo docker images
# or sudo docker image ls
```

## Run docker container using docker image
```bash
sudo docker run -d -it --name ubuntu-container custom-ubuntu-image
# -d means = deamon mode run container
# -it = intractive mode
# --name = give the name of container
```

## image

![image](https://github.com/kamblesuraj432/devops-support-engineer/assets/140583784/7fa6fba5-dd9a-41b4-bb63-5e6127872315)

