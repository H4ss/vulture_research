#!/bin/bash

WORKING_DIR="/usr/src/tmp"
cd "$WORKING_DIR" || exit 1

# Specify the log file
LOG_FILE="/usr/src/log/executioner_log.txt"

# Redirect all output to log file (stdout and stderr)
exec >"$LOG_FILE" 2>&1

unzip vulture_poly.zip
make -C Polymorphic/Linux-ELF/

# Execute the polymorphic program and capture its output
cp Polymorphic/Linux-ELF/polymorphic ./
OUTPUT="$(./polymorphic 2>&1)"
EXIT_STATUS=$?

# Display the captured output
echo "$OUTPUT"

# Display the exit status
echo "Exit status: $EXIT_STATUS"

# Use curl to send the captured output and exit status to the specified URL
curl -X POST -H "Content-Type: text/plain" --data-binary "{\"output\": \"$OUTPUT\", \"exit_status\": $EXIT_STATUS}" https://ouinonoui.free.beeceptor.com
