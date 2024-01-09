# Docker

## Creating docker image from Dockerfile
```bash
# using 'sudo su' is not a good practice.
sudo usermod -aG docker $USER && newgrp docker  # give the permission of current user
sudo docker build -t custom-ubuntu-image .
# -t means tag - given the image name
```
