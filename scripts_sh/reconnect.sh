#!/bin/sh
# 2022-07-19
# Author: Duke LeTran

# unmount existing connections
sudo umount -a -t cifs -l # a is all; t is type; l is "lazy"

# Header
echo '============================================================='
echo '                    Reconnecting Network Drives              '
echo '============================================================='

# Drives
CREDS='/path/to/credentials/file' # man mount.cifs
HOMEFOLDER='//HSNFM01/HomeFolders/dletran'
SHAREDDRIVE='//hshome/shared'

# MSG
SUCESS='Successfully connected to '
FAILED='FALED connecting to '

# mount shared drives
sudo mount -t cifs $HOMEFOLDER /mnt/home -o cred=$CREDS,vers=2.0 && echo $SUCCESS $HOMEFOLDER || echo $FAILED $HOMEFOLDER
sudo mount -t cifs $SHAREDDRIVE /mnt/shared -o credentials=$CREDS,vers=2.0 && echo $SUCCESS $SHAREDDRIVE || echo $SUCCESS $SHAREDDRIVE