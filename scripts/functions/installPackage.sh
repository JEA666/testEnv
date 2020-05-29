installPackage(){
  for i in ${package[@]}; do
    dpkg -s ${i} > /dev/null 2>&1
      if [ ${?} == 0 ]; then
         "${i} is allredy installed"
      else
        printf "%s\n" "Installing ${i}"
        sudo apt install ${i} -y 
      fi
  done
}
