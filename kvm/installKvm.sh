#!/bin/bash

# You need GO and Terraform installed for this to work.

# Check for sudo
if [ "$EUID" -ne 0 ]
  then echo "You need to run as root"
       echo "sudo ./installKvm.sh"
  exit
fi

source ./scripts/variables/bashVar.sh
source ./scripts/functions/installPackage.sh
source ./scripts/functions/addUser.sh

# Update ubuntu first
#apt-get update && apt-get upgrade -y

# Install all dependencies and KVM
package=${dependencies[@]}
installPackage

#Add user to KVM groups
userGroups=${groups[@]}
addUser

modprobe vhost_net
lsmod| grep vhost
echo "vhost_net" | sudo tee -a /etc/modules


#Check if KVM is working
echo "Check if KVM is working"
virsh list --all
