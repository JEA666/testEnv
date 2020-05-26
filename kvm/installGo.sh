#!/bin/bash

source ./scripts/variables/bashVar.sh

if [ -d ${appPath} && "which go" ]; then
 echo "${appPath} allredy installed"
else
  echo "install go"
   cd ${HOME}/Downloads
   wget -N https://dl.google.com/go/go1.14.2.linux-amd64.tar.gz
   sudo tar -C ${appPath} -xzf go1.14.2.linux-amd64.tar.gz
   mkdir -p ${GOPATH}/bin

   for i in ${goVars[@]}; do
     echo "export ${i}" >> ${HOME}/.profile
   done
fi

source ${HOME}/.profile
go version
cd ${installPath}