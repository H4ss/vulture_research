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
    && rm -rf /var/lib/apt/lists/*

# Containers network setup
COPY ./config/setup-iptables.sh setup-iptables.sh
RUN chmod +x setup-iptables.sh
RUN sh setup-iptables.sh
