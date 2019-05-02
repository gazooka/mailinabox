#!/bin/bash

./free-memory.sh

./update-packages.sh
./free-memory.sh
./reboot-if-required.sh

./upgrade-packages.sh
./free-memory.sh
./reboot-if-required.sh

./auto-remove-packages.sh
./free-memory.sh
./reboot-if-required.sh
