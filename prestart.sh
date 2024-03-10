#!/bin/bash

# Check if the network exists
network_exists=$(docker network ls --filter name=^vulture_net$ --format "{{.Name}}")
if [ -z "$network_exists" ]; then
    echo "Network 'vulture_net' does not exist. Creating..."
    docker network create vulture_net --driver bridge
else
    echo "Network 'vulture_net' already exists."
fi
