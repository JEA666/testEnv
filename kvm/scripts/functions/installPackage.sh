installPackage(){
  for i in ${package[@]}; do
    dpkg -s ${i} > /dev/null 2>&1

      if [ ${?} == 0 ]; then
        echo "${i} is alredy installed"
      else
        apt install ${i} -y 
      fi
    
  done
}
