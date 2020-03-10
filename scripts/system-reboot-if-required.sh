#!/bin/bash

# validate this script
state=$(set +o)
set -euo pipefail
shellcheck "$0"
eval "$state"

# reboot if one is required
if [ -f /var/run/reboot-required ]; then
        ./system-reboot.sh
fi
