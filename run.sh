#!/bin/bash

set -e

DISK=""
USERNAME="TravisYoder"
EMAIL="tyodf@allstate.com"
PASSWORD=""

# grab device identifier and device node
DISK=$(diskutil info $USERNAME | grep "Part of Whole" | grep -o "disk.*")

# format disk
diskutil eraseDisk JHFS+ $USERNAME $DISK

sleep 5

# mount disk
diskutil mountDisk $DISK

# copy ssh-add shell script
cp login.sh /Volumes/$USERNAME

# make ssh directory
mkdir /Volumes/$USERNAME/.ssh

# generate private/public key on disk
ssh-keygen -N '' -f /Volumes/$USERNAME/.ssh/id_rsa -t rsa -b 4096 -C $EMAIL

# ask for password to encrypt the disk
read -s -p "Enter Password: " PASSWORD

# encrypt the disk
diskutil cs convert /Volumes/$USERNAME -passphrase $PASSWORD
