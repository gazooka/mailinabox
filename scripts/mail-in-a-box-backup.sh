#!/bin/bash

if [ "$1" != "" ]; then
        sudo mailinabox/management/backup.py $1
else
        sudo mailinabox/management/backup.py
fi
./mail-in-a-box-copy-backups-to-azure.sh
