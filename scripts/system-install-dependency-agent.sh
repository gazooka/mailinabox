#!/bin/bash

# get agent installer
rm -f InstallDependencyAgent-Linux64.bin
wget -O InstallDependencyAgent-Linux64.bin https://aka.ms/dependencyagentlinux
chmod +x InstallDependencyAgent-Linux64.bin

# stop the service before installing
systemctl status -n 0 microsoft-dependency-agent.service
systemctl stop microsoft-dependency-agent.service

# install
./InstallDependencyAgent-Linux64.bin -s

# start it up
systemctl start microsoft-dependency-agent.service
systemctl status -n 0 microsoft-dependency-agent.service

# cleanup
rm -f InstallDependencyAgent-Linux64.bin
