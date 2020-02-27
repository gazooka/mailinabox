#!/bin/bash

# change info@example.com to the email address you want to receive failure notifications at

# upgrade packages
rm -f packages-upgrade.err
sudo apt-get --with-new-pkgs -y upgrade 2>packages-upgrade.err
if [ -s packages-upgrade.err ]; then
        # failed, have we already tried rebooting the server and re-configuring packages?
        if [ -f packages-upgrade.err.2 ]; then
                echo "Rebooted server; tried running dpkg --configure -a" | mail -s "packages-upgrade.sh failed" "info@example.com"
                exit 1
        fi
        # already tried rebooting the server?
        if [ -f packages-upgrade.err.1 ]; then
                # yes, so record this and try re-configuring the packages and rebooting
                echo "Dpkg'd" > packages-upgrade.err.2
                ./system-memory-free.sh
                sudo dpkg --configure -a
                ./system-reboot.sh
        fi
        # must be the first time this has failed, so record this and reboot the server (which will hopefully fix it)
        echo "Update failed" > packages-upgrade.err.1
        ./system-reboot.sh
else
        # update succeeded, so clear any error files
        rm -f packages-upgrade.err
        rm -f packages-upgrade.err.1
        rm -f packages-upgrade.err.2
fi
