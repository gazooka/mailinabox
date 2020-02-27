#!/bin/bash

# change info@example.com to the email address you want to receive failure notifications at

# auto-remove packages
rm -f auto-remove-packages.err
sudo apt-get -y autoremove 2>auto-remove-packages.err
if [ -s auto-remove-packages.err ]; then
        # failed, have we already tried rebooting the server and re-configuring packages?
        if [ -f auto-remove-packages.err.2 ]; then
                echo "Rebooted server; tried running dpkg --configure -a" | mail -s "auto-remove-packages.sh failed" "info@example.com"
                exit 1
        fi
        # already tried rebooting the server?
        if [ -f auto-remove-packages.err.1 ]; then
                # yes, so record this and try re-configuring the packages and rebooting
                echo "Dpkg'd" > auto-remove-packages.err.2
                ./free-memory.sh
                sudo dpkg --configure -a
                ./reboot.sh
        fi
        # must be the first time this has failed, so record this and reboot the server (which will hopefully fix it)
        echo "Update failed" > auto-remove-packages.err.1
        ./reboot.sh
else
        # update succeeded, so clear any error files
        rm -f auto-remove-packages.err
        rm -f auto-remove-packages.err.1
        rm -f auto-remove-packages.err.2
fi

