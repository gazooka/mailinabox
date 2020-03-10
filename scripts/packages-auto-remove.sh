#!/bin/bash

# validate this script
state=$(set +o)
set -euo pipefail
shellcheck "$0"
eval "$state"

# change info@example.com to the email address you want to receive failure notifications at

# auto-remove packages
rm -f packages-auto-remove.err
sudo apt-get -y autoremove 2>packages-auto-remove.err
if [ -s packages-auto-remove.err ]; then
        # failed, have we already tried rebooting the server and re-configuring packages?
        if [ -f packages-auto-remove.err.2 ]; then
                echo "Rebooted server; tried running dpkg --configure -a" | mail -s "auto-remove-packages.sh failed" "info@example.com"
                exit 1
        fi
        # already tried rebooting the server?
        if [ -f packages-auto-remove.err.1 ]; then
                # yes, so record this and try re-configuring the packages and rebooting
                echo "Dpkg'd" > packages-auto-remove.err.2
                ./system-memory-free.sh
                sudo dpkg --configure -a
                ./system-reboot.sh
        fi
        # must be the first time this has failed, so record this and reboot the server (which will hopefully fix it)
        echo "Update failed" > packages-auto-remove.err.1
        ./reboot.sh
else
        # update succeeded, so clear any error files
        rm -f packages-auto-remove.err
        rm -f packages-auto-remove.err.1
        rm -f packages-auto-remove.err.2
fi
