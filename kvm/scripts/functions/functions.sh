# Function for adding users to groups
addUser(){
  for i in ${userGroups[@]}; do
    if [ $(getent group ${i} | grep -q "\b${USER}\b" ) ]; then
      printf "%s\n" "${g} exist"
    else
      printf "%s\n" "adding ${USER} to ${i}"
      sudo adduser ${USER} ${i}
    fi
  done
}

# Function for creating directories
createDir(){
  for i in ${dir[@]}; do
    if [ -d "${i}" ]; then 
      printf "%s\n" "${i} exist"
    else
      printf "%s\n" "Creating ${i}"
      mkdir -p ${i}
    fi
  done
}

# Function for apt packege
installApt(){
  for i in ${package[apt]}; do
    dpkg -s ${i} > /dev/null 2>&1
    if [ ${?} == 0 ]; then
      printf "%s\n" "${i} is allredy installed"
    else
      printf "%s\n" "Installing ${i}"
      sudo apt install ${i} -y 
    fi
  done
}

downloadWget(){
  cd "${HOME}/Downloads"
  for i in ${package[@]}; do
    if [ -f ${i} ]; then
      printf "%s\n" "${i} is allredy downloaded"
    else
      printf "%s\n" "Downloading ${i}"
      wget -N ${i} 
    fi
  done
}

downloadGit(){
  for i in ${package[@]}; do
    if [ -d "${GOPATH}${srcPath}${pluginDir}/.git" ]; then
      printf "%s\n" "${i} is allredy downloaded"
    else
      printf "%s\n" "Downloading ${i}"
      git clone ${i} 
    fi
  done
}