#!/bin/bash

# validate this script
state=$(set +o)
set -euo pipefail
shellcheck "$0"
eval "$state"

# free memory
sudo sync; sudo sysctl -w vm.drop_caches=3

sudo sync && echo 3 | sudo tee /proc/sys/vm/drop_caches
