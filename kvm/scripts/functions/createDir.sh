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