#!/bin/bash

dir=$(pwd);

# Checkout branch, if set.
if [[ $1 ]]; then
   git checkout $1
fi;

# Get note about current branch and git pull --prune in it.
branchname=`git branch | grep '*' | cut -d' ' -f 2`;
echo git pull --prune on branch ${branchname} in repository ${dir}
git pull --prune
