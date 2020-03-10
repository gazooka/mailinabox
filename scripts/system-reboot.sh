#!/bin/bash

# validate this script
state=$(set +o)
set -euo pipefail
shellcheck "$0"
eval "$state"

# backup mail-in-a-box before any reboot for safety
./mail-in-a-box-backup.sh

# reboot
sudo reboot
