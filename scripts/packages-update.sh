#!/bin/bash

# change info@example.com to the email address you want to receive failure notifications at

# update packages
rm -f update-packages.err
sudo apt-get -y update 2>update-packages.err
if [ -s update-packages.err ]; then
        # failed, have we already tried rebooting the server and re-configuring packages?
        if [ -f update-packages.err.update.2 ]; then
                echo "Rebooted server; tried running dpkg --configure -a" | mail -s "update-packages.sh failed" "info@example.com"
                exit 1
        fi
        # already tried rebooting the server?
        if [ -f update-packages.err.update.1 ]; then
                # yes, so record this and try re-configuring the packages and rebooting
                echo "Dpkg'd" > update-packages.err.update.2
                ./free-memory.sh
                sudo dpkg --configure -a
                ./reboot.sh
        fi
        # must be the first time this has failed, so record this and reboot the server (which will hopefully fix it)
        echo "Update failed" > update-packages.err.update.1
        ./reboot.sh
else
        # update succeeded, so clear any error files
        rm -f update-packages.err
        rm -f update-packages.err.update.1
        rm -f update-packages.err.update.2
fi
