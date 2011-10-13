#!/bin/bash -eu
#
# Author: Anton Stoychev <antitoxic@gmail.com>
#
#
source ./lib/utils/utils.sh

info "* The script:
* 1) Adds the current user to www-data group
* 2) Outputs the mount options
*
* You can use the output to add /etc/fstab for auto mouting at startup
-----------
* Aditional info:
* 1) Make mountpoint

sudo mkdir /media/<<name>>

* 2) Get list of mountable devices with UUIDs and other info:

sudo blkid
"
userName=`whoami`
groupName='www-data'
groupId=`grep "^$groupName:" /etc/group | cut -d: -f3`
#userId=`id -u`
userId=`id -u www-data`

sudo adduser $userName www-data
echo "UUID=<<your_device_uuid>> /store ntfs defaults,gid=$groupId,uid=$userId,locale=en_US.UTF-8,force 0 0"

