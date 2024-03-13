# Use Ubuntu 18.04 LTS as base image
FROM ubuntu:18.04

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Update and install necessary packages
RUN apt-get update && apt-get install -y \
    iputils-ping \
    nmap \
    net-tools \
    iputils-ping \
    curl \
    wget \
    iptables \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Containers network setup
COPY ./config/setup-iptables.sh /usr/src/setup-iptables.sh
RUN chmod +x /usr/src/setup-iptables.sh
RUN sh /usr/src/setup-iptables.sh

# PoC setup
COPY ./vulture_src /usr/src/vulture_src
