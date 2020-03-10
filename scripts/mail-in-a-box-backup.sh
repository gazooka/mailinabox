#!/bin/bash

# validate this script
state=$(set +o)
set -euo pipefail
shellcheck "$0"
eval "$state"

# backup and copy backups to Azure
if [ "$1" != "" ]; then
        sudo mailinabox/management/backup.py "$1"
else
        sudo mailinabox/management/backup.py
fi
./mail-in-a-box-copy-backups-to-azure.sh
