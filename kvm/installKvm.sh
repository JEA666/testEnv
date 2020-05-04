#!/bin/bash

# you need GO and Terraform installed for this to work.

# Check for sudo
if [ "$EUID" -ne 0 ]
  then echo "You need to run as root"
       echo "sudo ./installKvm.sh"
  exit
fi

export PATH=$PATH:/usr/local/bin:/usr/local/sbin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin:/usr/local/go/bin
source ./script/defaults/bashVar.sh
source ./script/func/aptInstall.sh

# Update ubuntu first
#apt-get update && apt-get upgrade -y

# Install all dependencies
package=${dependencies[@]}
installPackage

# Install KVM
package=${apps[@]}
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

# Install Terraform plugin

su ${SUDO_USER} mkdir -p ${GOPATH}/src/github.com/dmacvicar;
cd ${GOPATH}/src/github.com/dmacvicar
sudo -u ${SUDO_USER} git clone https://github.com/dmacvicar/terraform-provider-libvirt.git
cd $GOPATH/src/github.com/dmacvicar/terraform-provider-libvirt
echo $PATH
which go
echo $?
pwd
sudo -u jea make install