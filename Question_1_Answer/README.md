# Docker

## Creating docker image form Dockerfile Command is Below
```bash
# using 'sudo su' is not a good practice.
sudo usermod -aG docker $USER && newgrp docker
sudo docker build -t custom-ubuntu-image .
# -t means tag - given the image name
```
