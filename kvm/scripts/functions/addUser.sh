addUser(){
  for g in ${userGroups[@]}; do
    
    if [ $(getent group ${g} | grep -q "\b${SUDO_USER}\b" ) ]; then
      echo "${g} exist"
      
    else
      adduser ${SUDO_USER} ${g}
    fi

  done
}
