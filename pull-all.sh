#!/bin/bash

declare -a respositories;

# Check configuration file exists.
config_file=$(dirname $0)/config/$1.cfg
if [ ! -r ${config_file} ]; then
   echo Configuration file ${config_file} does not exist.
   exit
fi;

repositories=( $( cat <$(dirname $0)/config/$1.cfg ) )
old_dir=$(pwd);

for dir in "${repositories[@]}"; do
   echo =====================

   # Check repository folder exists.
   if [ ! -d ${dir} ]; then
      echo Repository folder ${dir} does not exist.
      continue
   fi;

   # Change dir to repository folder.
   cd ${dir}

   # Checkout branch, if set.
   if [[ $2 ]]; then
      git checkout $2
   fi;

   # Get note about current branch and git pull --prune in it.
   branchname=`git branch | grep '*' | cut -d' ' -f 2`;
   echo git pull --prune on branch ${branchname} in repository ${dir}
   git pull --prune
   echo git town prune-branches on branch ${branchname} in repository ${dir}
   git town prune-branches
done

cd ${old_dir}
