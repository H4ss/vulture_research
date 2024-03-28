#!/bin/bash

zip ./archives/important.zip IMPORTANT.md vulture_seeker.sh

if [ "$1" == "all" ]; then
    zip -r ./archives/vulture_poly.zip Polymorphic
fi
