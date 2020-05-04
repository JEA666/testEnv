installPackage(){
  for i in ${dependencies[@]}; do
    if dpkg -s ${i} > /dev/null 2>&1; then
      if [ ${?} == 0 ]; then
        echo "${i} is alredy installed"
        else
          apt install ${i} -y 
      fi
    fi
  done
}