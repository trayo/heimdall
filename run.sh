#!/bin/bash

set -e

DISK=""
USERNAME="TravisYoder"
EMAIL="tyodf@allstate.com"

# grab device identifier and device node
DISK=$(diskutil info $USERNAME | grep "Part of Whole" | grep -o "disk.*")

# format disk
diskutil eraseDisk JHFS+ $USERNAME $DISK

# mount disk
diskutil mountDisk $DISK

# copy ssh-add shell script
cp login.sh /Volumes/$USERNAME

# generate private/public key on disk
ssh-keygen -f /Volumes/$USERNAME/"$USERNAME.id_rsa" -t rsa -b 4096 -C $EMAIL

# ask for password to encrypt disk