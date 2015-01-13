#!/bin/bash

# This script is used for project specific frontend to backend linking.

old_dir=$(pwd);

project_prefix_frontend=`cat <$(dirname $0)/config/project-prefix-frontend.cfg`
project_prefix_backend=`cat <$(dirname $0)/config/project-prefix-backend.cfg`
project_names=( $( cat <$(dirname $0)/config/project-names.cfg ) )

if [[ $1 && -d "$1" ]]; then
  path=$1/
else
  path=${old_dir}/
fi;

for project_name in "${project_names[@]}"; do

  dir=${path}${project_prefix_frontend}${project_name}

  if [ ! -d ${dir} ]; then
    echo Frontend folder ${dir} does not exist.
    exit
  fi;

  echo Make frontend project ${dir} link public with bower link;
  cd ${dir};
  bower link
  cd ..


  dir=${path}${project_prefix_backend}${project_name}

  if [ ! -d ${dir} ]; then
    echo Backend folder ${dir} does not exist.
    exit
  fi;

  echo Link frontend project ${dir} into backend with bower link frontend-name;
  cd ${dir};
  basename=`basename ${dir} | cut -d'-' -f 3`;
bower link ${project_name}

done;
cd ${old_dir}
