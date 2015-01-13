#!/bin/bash
 
declare -a projects

old_dir=$(pwd);

projects=( $( cat <$(dirname $0)/config/frontends.cfg ) )

for dir in "${projects[@]}"; do
  echo Build frontend ${dir} with npm install;
  cd ${dir};
  npm install;
done;

cd ${old_dir}
