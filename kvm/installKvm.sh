#!/bin/bash

# you need GO and Terraform installed for this to work.

# Check for sudo
if [ "$EUID" -ne 0 ]
  then echo "You need to run as root"
       echo "sudo ./installKvm.sh"
  exit
fi

source ./scripts/vars/bashVar.sh
source ./scripts/func/installPackage.sh

# Update ubuntu first
#apt-get update && apt-get upgrade -y

# Install all dependencies and KVM
package=${dependencies[@]}
installPackage

# Configuration
# Add users
adduser ${SUDO_USER} libvirt
adduser ${SUDO_USER} kvm 

modprobe vhost_net
lsmod| grep vhost
echo "vhost_net" | sudo tee -a /etc/modules


#Check if KVM is working
echo "Check if KVM is working"
virsh list --all
