# Use Ubuntu 18.04 LTS as base image
FROM ubuntu:18.04

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Update and install necessary packages including ClamAV
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
    nano \
    zip \
    clamav \
    clamav-daemon \
    && freshclam \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory to /usr/src
WORKDIR /usr/src

# Containers setup
COPY ./config scripts
COPY ./tools/archives/important.zip ./
RUN mkdir log # Log folder for the script output that will be loaded as a cronjob
RUN chmod +x ./scripts/setup-iptables.sh && ./scripts/setup-iptables.sh
RUN chmod +x ./scripts/sync_to_public.sh
RUN chmod +x ./scripts/exec_all_routine.sh
RUN chmod +x ./scripts/populate_replication.sh

# Preparing the replication folder
RUN mkdir desktop
RUN echo "This info should never leave this place: vanilla > chocolate" > /usr/src/desktop/sensitive_info.secret
RUN cp ./scripts/populate_replication.sh ./desktop

# Add your script to crontab (including ClamAV scan command)
RUN (crontab -l ; echo "* * * * * /usr/src/scripts/sync_to_public.sh >> /usr/src/log/public_sync.log 2>&1") | crontab
RUN (crontab -l ; echo "* * * * * (sleep 10 ; /usr/src/scripts/exec_all_routine.sh) >> /usr/src/log/exel_all.log 2>&1") | crontab
RUN (crontab -l ; echo "2 * * * * clamscan -r --infected --verbose /home/public >> /usr/src/log/clamav_scan_public.log 2>&1") | crontab
#RUN (crontab -l ; echo "2 * * * * clamscan -r --infected --verbose /usr/src >> /usr/src/log/clamav_scan_usr.log 2>&1") | crontab

# Update ClamAV database and keep the daemon running
ENTRYPOINT ["sh", "-c", "freshclam; clamd; cron -f"]
