#!/bin/bash

# You need GO and Terraform installed for this to work.

source ./scripts/variables/bashVar.sh

# # Install Terraform
# cd ${HOME}/Downloads
# wget -N https://releases.hashicorp.com/terraform/${tfVersion}/terraform_${tfVersion}_linux_amd64.zip

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
