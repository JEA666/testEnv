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
