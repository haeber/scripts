#!/bin/sh

declare -a dist_files
config_dir=$(dirname $0)/config/
dist_files=( $( ls -1 ${config_dir} | grep '.dist' ) )

for dist_file in "${dist_files[@]}"; do
  echo cp ${config_dir}/${dist_file} ${config_dir}/${dist_file%.dist}
  cp ${config_dir}/${dist_file} ${config_dir}/${dist_file%.dist}
done;
