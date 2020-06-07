#!/bin/bash

# Declare some arrays
declare -A dependencies

# Source some files
source ${HOME}/.profile
source ./scripts/variables/bashVar.sh
source ./scripts/functions/functions.sh

# Update ubuntu first
sudo apt-get update && sudo apt-get upgrade -y

# Check and create directories
dir=${directories[@]}
createDir

# Download package and install dependencies
# Download Go, Terraform and a cloud ubuntu image(18.04)
package=${dependencies[wget]}
downloadWget

# Download Terraform provider libvirt plugin
package=${dependencies[git]}
downloadGit

# Download and install all dependencies and KVM
package=${dependencies[apt]}
installApt

#Add user to KVM groups
userGroups=${groups[@]}
addUser

# Configure network
sudo modprobe vhost_net
lsmod| grep vhost
echo "vhost_net" | sudo tee -a /etc/modules

#Check if KVM is working
echo "Check if KVM is working"
virsh list --all

# Install Go
if [ -x "$(command -v go)" ]; then
  printf "\e[1;32m%-6s\e[m\n" "Go allredy installed"
else
  printf "\e[1;33m%-6s\e[m\n" "install go"
  cd ${HOME}/Downloads
  sudo tar -C ${appPath} -xzf go1.14.2.linux-amd64.tar.gz
  for i in ${goVars[@]}; do
    grep -qxF "export ${i}" ${HOME}/.profile
    if [ $? -ne 0 ]; then
      echo "export ${i}" >> ${HOME}/.profile
    fi
  done
fi

source ${HOME}/.profile
go version

# Install Terraform
if [ -x "$(command -v terraform)" ]; then
  printf "\e[1;32m%-6s\e[m\n" "Terraform allredy installed"
else
  printf "\e[1;33m%-6s\e[m\n" "install Terraform"
  cd ${HOME}/Downloads
  unzip terraform_0.12.25_linux_amd64.zip
  sudo mv terraform /usr/local/bin/
  terraform --version
fi

# Build Terraform Libvirt plugin from src repo
if [ -d terraform-provider-libvirt]
printf "\e[1;32m%-6s\e[m\n" "Change to git repo dir"
cd ${GOPATH}${srcPath}${pluginDir}

printf "\e[1;32m%-6s\e[m\n" "Make terraform libvirt plugin"
make install

printf "\e[1;32m%-6s\e[m\n" "Copy plugin to Terraform folder"
cp ${GOBIN}${pluginDir} ${HOME}${terraformPath}