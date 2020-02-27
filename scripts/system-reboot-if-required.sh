#!/bin/bash

# reboot if one is required
if [ -f /var/run/reboot-required ]; then
        ./system-reboot.sh
fi
