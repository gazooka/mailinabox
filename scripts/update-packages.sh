#!/bin/bash

# update packages
rm -f update-packages.err
sudo apt-get -y update 2>update-packages.err
if [ -s update-packages.err ]; then
        # failed, have we already tried rebooting the server and re-configuring packages?
        if [ -f update-packages.err.update.2 ]; then
                echo "Rebooted server; tried running dpkg --configure -a" | mail -s "upgrade-packages.sh failed (update)" "info@simplesyndi$
                exit 1
        fi
        # already tried rebooting the server?
        if [ -f update-packages.err.update.1 ]; then
                # yes, so record this and try re-configuring the packages and rebooting
                echo "Dpkg'd" > update-packages.err.update.2
                sudo dpkg --configure -a
                ./reboot.sh
        fi
        # must be the first time this has failed, so record this and reboot the server (which will hopefully fix it)
        echo "Update failed" > update-packages.err.update.1
        ./reboot.sh
else
        # update succeeded, so clear any error files
        rm -f update-packages.err.update.1
        rm -f update-packages.err.update.2
fi

# upgrade packages
rm -f update-packages.err
sudo apt-get --with-new-pkgs -y upgrade 2>update-packages.err
if [ -s update-packages.err ]; then
        # failed, have we already tried rebooting the server and re-configuring packages?
        if [ -f update-packages.err.upgrade.2 ]; then
                echo "Rebooted server; tried running dpkg --configure -a" | mail -s "upgrade-packages.sh failed (upgrade)" "info@simplesynd$
                exit 1
        fi
        # already tried rebooting the server?
        if [ -f update-packages.err.upgrade.1 ]; then
                # yes, so record this and try re-configuring the packages and rebooting
                echo "Dpkg'd" > update-packages.err.upgrade.2
                sudo dpkg --configure -a
                ./reboot.sh
        fi
        # must be the first time this has failed, so record this and reboot the server (which will hopefully fix it)
        echo "Update failed" > update-packages.err.upgrade.1
        ./reboot.sh
else
        # update succeeded, so clear any error files
        rm -f update-packages.err.upgrade.1
        rm -f update-packages.err.upgrade.2
fi

# auto-remove packages
rm -f update-packages.err
sudo apt-get -y autoremove 2>update-packages.err
if [ -s update-packages.err ]; then
        # failed, have we already tried rebooting the server and re-configuring packages?
        if [ -f update-packages.err.autoremove.2 ]; then
                echo "Rebooted server; tried running dpkg --configure -a" | mail -s "upgrade-packages.sh failed (auto-remove)" "info@simple$
                exit 1
        fi
        # already tried rebooting the server?
        if [ -f update-packages.err.autoremove.1 ]; then
                # yes, so record this and try re-configuring the packages and rebooting
                echo "Dpkg'd" > update-packages.err.autoremove.2
                sudo dpkg --configure -a
                ./reboot.sh
        fi
        # must be the first time this has failed, so record this and reboot the server (which will hopefully fix it)
        echo "Update failed" > update-packages.err.autoremove.1
        ./reboot.sh
else
        # update succeeded, so clear any error files
        rm -f update-packages.err.autoremove.1
        rm -f update-packages.err.autoremove.2
fi

# reboot if one is required
rm -f update-packages.err
if [ -f /var/run/reboot-required ]; then
        ./reboot.sh
fi
