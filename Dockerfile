# Use Ubuntu 18.04 LTS as base image
FROM ubuntu:18.04

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Update and install necessary packages
RUN apt-get update && apt-get install -y \
    iputils-ping \
    nmap \
    # Add any other tools you need here, for example:
    net-tools \
    iputils-ping \
    curl \
    wget \
    #[other-packages-you-need] \
    && rm -rf /var/lib/apt/lists/*

# Any other custom commands
