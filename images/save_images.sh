#!/bin/bash

file="../gitc/k8s-for-docker-desktop/images.properties"

output='v1.18.6'
if [ ! -d $output ]; then
    mkdir -p $output
    echo "mkdir $output"
fi

if [ -f "$file" ]
then
  echo "$file found."

  while IFS='=' read -r key value
  do
    #echo "${key}=${value}"
   echo  "start to save ${key}"
   name=$(echo ${key}|cut -d '/' -f 2)
   docker save ${key} -o "${output}/${name}.img"
  done < "$file"

else
  echo "$file not found."
fi

