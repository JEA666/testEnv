#!/bin/bash

source ./scripts/variables/bashVar.sh

#if [ -d ${appPath} ]; then
#  echo "${appPath} allredy installed"
#else
  cd ${HOME}/Downloads
  wget -N https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz
  sudo mkdir -p ${appPath}
  sudo tar -C ${appPath} -xzf go1.14.2.linux-amd64.tar.gz
  mkdir -p ${GOPATH}/bin
    for i in ${goVars[@]}; do
      echo "export ${i}" >> ${HOME}/.profile
      source ${HOME}/.profile
    done
#fi