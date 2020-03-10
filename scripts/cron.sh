#!/bin/bash

# validate this script
state=$(set +o)
set -euo pipefail
shellcheck "$0"
eval "$state"

# backup mail-in-a-box then update / upgrade / auto-remove packages
./mail-in-a-box-backup.sh

./system-memory-free.sh
./packages-update.sh
./system-reboot-if-required.sh

./system-memory-free.sh
./packages-upgrade.sh
./system-reboot-if-required.sh

./system-memory-free.sh
./packages-auto-remove.sh
./system-reboot-if-required.sh

./system-memory-free.sh
