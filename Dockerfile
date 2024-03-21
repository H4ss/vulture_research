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
    cron \
    build-essential \
    rsync \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory to /usr/src
WORKDIR /usr/src

# Containers network setup
# Note: With WORKDIR set, paths are relative to /usr/src
# COPY ./config/setup-iptables.sh setup-iptables.sh
COPY ./config scripts
RUN chmod +x ./scripts/setup-iptables.sh && ./scripts/setup-iptables.sh
RUN chmod +x ./scripts/sync_to_public.sh

# preparing the replication folder
RUN mkdir replication
RUN echo "Agent "$(whoami) + " date: "$(date) > /usr/src/replication/$(whoami).txt
RUN echo "This info should never leave this place" > /usr/src/replication/sensitive_info.secret

# Add your script to crontab
RUN (crontab -l ; echo "* * * * * /usr/src/scripts/sync_to_public.sh") | crontab

# Start cron in the foreground
CMD ["cron", "-f"]



# PoC setup
# Copies the entire vulture_src directory content into /usr/src/vulture_src
COPY ./vulture_src vulture_src
