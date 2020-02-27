#!/bin/bash

./mail-in-a-box-backup.sh

./system-memory-free.sh

./packages-update.sh
./system-memory-free.sh
./system-reboot-if-required.sh

./packages-upgrade.sh
./system-memory-free.sh
./system-reboot-if-required.sh

./packages-auto-remove.sh
./system-memory-free.sh
./system-reboot-if-required.sh
