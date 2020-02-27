#!/bin/bash

# if mail-in-a-box has already been installed, perform a backup first in case one hasn't been done
if sudo test -e "./mailinabox/management/backup.py"; then
	./mail-in-a-box-backup.sh
fi

# do the install / upgrade
curl -s https://mailinabox.email/setup.sh | sudo bash
