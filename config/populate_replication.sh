#!/bin/bash

# creating some files and writing them up
echo "Agent "$(whoami) + " date: "$(date) > /usr/src/replication/$(whoami).txt
