#!/bin/bash

# change info@example.com to the email address you want to receive failure notifications at

# upgrade packages
rm -f upgrade-packages.err
sudo apt-get --with-new-pkgs -y upgrade 2>upgrade-packages.err
if [ -s upgrade-packages.err ]; then
        # failed, have we already tried rebooting the server and re-configuring packages?
        if [ -f upgrade-packages.err.2 ]; then
                echo "Rebooted server; tried running dpkg --configure -a" | mail -s "upgrade-packages.sh failed" "info@example.com"
                exit 1
        fi
        # already tried rebooting the server?
        if [ -f upgrade-packages.err.1 ]; then
                # yes, so record this and try re-configuring the packages and rebooting
                echo "Dpkg'd" > upgrade-packages.err.2
                ./free-memory.sh
                sudo dpkg --configure -a
                ./reboot.sh
        fi
        # must be the first time this has failed, so record this and reboot the server (which will hopefully fix it)
        echo "Update failed" > upgrade-packages.err.1
        ./reboot.sh
else
        # update succeeded, so clear any error files
        rm -f upgrade-packages.err
        rm -f upgrade-packages.err.1
        rm -f upgrade-packages.err.2
fi
