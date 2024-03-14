# Use Ubuntu 18.04 LTS as base image
FROM ubuntu:18.04

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Update and install necessary packages
RUN apt-get update && apt-get install -y \
    iputils-ping \
    nmap \
    net-tools \
    curl \
    wget \
    iptables \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory to /usr/src
WORKDIR /usr/src

# Containers network setup
# Note: With WORKDIR set, paths are relative to /usr/src
COPY ./config/setup-iptables.sh setup-iptables.sh
RUN chmod +x setup-iptables.sh && ./setup-iptables.sh

# PoC setup
# Copies the entire vulture_src directory content into /usr/src/vulture_src
COPY ./vulture_src vulture_src
