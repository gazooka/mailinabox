#!/bin/bash

# change "URL" to the URL of the storage account to use

if sudo test -e "./azcopy"; then
	sudo ./azcopy cp "../user-data/backup/encrypted/*" "URL" --overwrite ifSourceNewer
fi
