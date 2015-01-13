#!/bin/bash

declare -a projects

old_dir=$(pwd);

projects=( $( cat <$(dirname $0)/config/backends.cfg ) )

for dir in "${projects[@]}"; do
  echo Build backend ${dir} with ant dev clean;
  cd ${dir};
  ant dev-clean;
done;

cd ${old_dir}
