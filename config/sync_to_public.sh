#!/bin/bash

# Define source and destination directories
SRC_DIR="/usr/src/replication/"
DEST_DIR="/home/public/"

# Synchronize files from the source to the destination (maybe remove the delete)
# rsync -av --delete $SRC_DIR $DEST_DIR
rsync -av $SRC_DIR $DEST_DIR

# we should move the script that will compile the malicious code by hand in the replication folder
