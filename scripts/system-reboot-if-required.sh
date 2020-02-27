#!/bin/bash

# reboot if one is required
if [ -f /var/run/reboot-required ]; then
        ./reboot.sh
fi
