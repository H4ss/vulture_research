#!/bin/bash

# creating some files and writing them up
echo "Agent "$(whoami) + "date: "$(date) + "from: "$(ifconfig | grep 'inet 172' | awk '{print $2}') >> /usr/src/replication/$(whoami)_$HOSTNAME.txt
