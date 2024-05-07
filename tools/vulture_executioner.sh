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
# Potentiel solution ici:
# 1. call à http://host/port_service/dispatch
# 2. dispatch renvoie un port
# 3. dans la commande d'en dessous, on envoie le premier port qui n'est pas "occupied"
OUTPUT="$(./polymorphic 2>&1)"
EXIT_STATUS=$?
# 4. si l'exit status est égal à zero, on renvoie http://host/port_service/taken&port_nb=$PORT_NB

# Display the captured output
echo "$OUTPUT"

# Display the exit status
echo "Exit status: $EXIT_STATUS"

# Use curl to send the captured output and exit status to the specified URL
curl -X POST -H "Content-Type: text/plain" --data-binary "{\"hostname\":\"$HOSTNAME\",\"output\": \"$OUTPUT\", \"exit_status\": $EXIT_STATUS}" https://ouinonoui.free.beeceptor.com
