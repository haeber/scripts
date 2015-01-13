#!/bin/bash

declare -a projects

old_dir=$(pwd);

projects=( $( cat <$(dirname $0)/config/backends.cfg ) )

for dir in "${projects[@]}"; do
  echo Setup dev project ${dir};
  cd ${dir};
  ./setup-dev.sh;
done;

cd ${old_dir}
