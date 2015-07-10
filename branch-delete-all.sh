#!/bin/bash

declare -a respositories;

# Check configuration file exists.
config_file=$(dirname $0)/config/$1.cfg
if [ ! -r ${config_file} ]; then
   echo Configuration file ${config_file} does not exist.
   exit
fi;

# Abort if no branch is set as parameter.
if [[ ! $2 ]]; then
   echo Branch not set.
   exit;
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

   # Get note about current branch and git pull --prune in it.
   echo git branch -D $2 in repository ${dir}
   git branch -D $2
done

cd ${old_dir}
