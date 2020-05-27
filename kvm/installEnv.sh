#!/bin/bash

# Declare some arrays
declare -A dependencies

# Source some files
source ${HOME}/.profile
source ./scripts/variables/bashVar.sh
source ./scripts/functions/functions.sh

# Update ubuntu first
apt-get update && apt-get upgrade -y

# Check and create directories
dir=${directories[@]}
createDir

# Download package and install dependencies
package=${dependencies[@]}
downloadWget

package=${dependencies[@]}
downloadGit

# Install Go
if [ -x "$(command -v go)" ]; then
  printf "%s\n" "Go allredy installed"
else
  printf "%s\n" "install go"
  cd ${HOME}/Downloads
#  wget -N https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz
  sudo tar -C ${appPath} -xzf go1.14.2.linux-amd64.tar.gz
#  mkdir -p ${GOPATH}/bin
  for i in ${goVars[@]}; do
    grep -qxF "export ${i}" ${HOME}/.profile
    if [ $? -ne 0]; then
      echo "export ${i}" >> ${HOME}/.profile
    fi
  done
fi

source ${HOME}/.profile
go version

# Install Terraform and libvirt plugin
# if [ -x "$(command -v terraform)" ]; then
#   printf "%s\n" "Terraform allredy installed"
# else
#   printf "%s\n" "install Terraform"
#   cd ${HOME}/Downloads
# #  wget -N https://releases.hashicorp.com/terraform/${tfVersion}/terraform_${tfVersion}_linux_amd64.zip
#   unzip terraform_${tfVersion}_linux_amd64.zip
#   sudo mv terraform /usr/local/bin/
#   terraform --version
# fi

# # Download src repo
# if [ -d "${GOPATH}${srcPath}${pluginDir}/.git" ]; then
#   printf "%s\n" "Git repo allredy exist"
#   printf "%s\n" "Cd to git repo and check for updates"
#   cd ${GOPATH}${srcPath}${pluginDir} && git pull
# else
#   printf "%s\n" "Cd to git repo and clone"
#   cd ${GOPATH}${srcPath} && git clone ${gitUrl}
# fi

# # Build from src repo
# printf "%s\n" "Change to git repo dir"
# cd ${GOPATH}${srcPath}${pluginDir}

# printf "%s\n" "Make terraform libvirt plugin"
#  make install

# printf "%s\n" "Copy plugin to Terraform folder"
# cp ${GOBIN}${pluginDir} ${HOME}${terraformPath}


# # Install all dependencies and KVM
# package=${dependencies[@]}
# installPackage

# #Add user to KVM groups
# userGroups=${groups[@]}
# addUser

# modprobe vhost_net
# lsmod| grep vhost
# echo "vhost_net" | sudo tee -a /etc/modules


# #Check if KVM is working
# echo "Check if KVM is working"
# virsh list --all
