#!/bin/sh

#解决Ubuntu下不能访问nfts磁盘的问题；Error mounting /dev/sda8 at /media/my/XXX: Command-line `mount -t "ntfs" -o
sudo -u root ntfsfix /dev/sda6 
sudo -u root ntfsfix /dev/sda5 
sudo -u root ntfsfix /dev/sda4 
