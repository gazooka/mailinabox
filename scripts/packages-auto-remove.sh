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
        # failed, have we tried rebooting the server and re-configuring packages three times?
        if [ -f packages-auto-remove.err.4 ]; then
                echo "Rebooted server and tried running dpkg --configure -a three times" | mail -s "packages-auto-remove.sh failed" "info@example.com"
                exit 1
        fi
        # failed, have we already tried rebooting the server and re-configuring packages?
        if [ -f packages-auto-remove.err.3 ]; then
                # yes, so record this and try a third re-configure of the packages and rebooting
                echo "Dpkg'd" > packages-auto-remove.err.4
                ./system-memory-free.sh
                sudo dpkg --configure -a
                ./system-reboot.sh
        fi
        # failed, have we already tried rebooting the server and re-configuring packages?
        if [ -f packages-auto-remove.err.2 ]; then
                # yes, so record this and try a second re-configure of the packages and rebooting
                echo "Dpkg'd" > packages-auto-remove.err.3
                ./system-memory-free.sh
                sudo dpkg --configure -a
                ./system-reboot.sh
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
        echo "Auto-remove failed" > packages-auto-remove.err.1
        ./reboot.sh
else
        # auto-remove succeeded, so clear any error files
        rm -f packages-auto-remove.err
        rm -f packages-auto-remove.err.1
        rm -f packages-auto-remove.err.2
        rm -f packages-auto-remove.err.3
        rm -f packages-auto-remove.err.4
fi
