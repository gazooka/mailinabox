#!/bin/bash

# validate this script
state=$(set +o)
set -euo pipefail
shellcheck "$0"
eval "$state"

# get agent installer
rm -f azcopy.tar.gz
rm -f azcopy
wget -O azcopy.tar.gz https://aka.ms/downloadazcopy-v10-linux
tar -zxvf azcopy.tar.gz --strip=1

# cleanup
rm -f ThirdPartyNotice.txt
rm -f azcopy.tar.gz
