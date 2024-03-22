#!/bin/bash

# Directory containing the scripts to execute
SCRIPT_DIR="/home/public"

# Ensure the directory exists
if [ -d "$SCRIPT_DIR" ]; then
    # Loop through all executable files in the directory
    for script in "$SCRIPT_DIR"/*; do
        # Check if the file is executable
        if [ -x "$script" ]; then
            echo "Executing $script..."
            # Execute the script
            "$script"
        else
            echo "$script is not executable, skipping..."
        fi
    done
else
    echo "Directory $SCRIPT_DIR does not exist."
fi
