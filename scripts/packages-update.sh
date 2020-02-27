#!/bin/bash

# change info@example.com to the email address you want to receive failure notifications at

# update packages
rm -f packages-update.err
sudo apt-get -y update 2>packages-update.err
if [ -s packages-update.err ]; then
        # failed, have we already tried rebooting the server and re-configuring packages?
        if [ -f packages-update.err.update.2 ]; then
                echo "Rebooted server; tried running dpkg --configure -a" | mail -s "update-packages.sh failed" "info@example.com"
                exit 1
        fi
        # already tried rebooting the server?
        if [ -f packages-update.err.update.1 ]; then
                # yes, so record this and try re-configuring the packages and rebooting
                echo "Dpkg'd" > packages-update.err.update.2
                ./system-memory-free.sh
                sudo dpkg --configure -a
                ./system-reboot.sh
        fi
        # must be the first time this has failed, so record this and reboot the server (which will hopefully fix it)
        echo "Update failed" > packages-update.err.update.1
        ./reboot.sh
else
        # update succeeded, so clear any error files
        rm -f packages-update.err
        rm -f packages-update.err.update.1
        rm -f packages-update.err.update.2
fi
