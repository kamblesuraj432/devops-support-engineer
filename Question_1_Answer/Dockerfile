# Use Ubuntu latest as the base image
FROM ubuntu
# Update package lists and install required packages
RUN apt-get update && apt-get install -y \
    telnet \
    curl \
    ffmpeg
# Set the default command to launch bash when running a container
CMD ["bash"]
