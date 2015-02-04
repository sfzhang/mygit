#!/bin/bash

# set upstrem for syncing repository from Github

usage="./sync-git.sh upstream_name"

# upstream name
if [ $# -ne 1 ]; then
    echo $usage
    exit 1
fi
upstream_name=$1

# username
user_name=`git config -l | grep "^user\.name=" | awk -F= '{ print $2 }'`
echo $user_name

# add remote
git remote add upstream `git config --local -l | grep origin.url | awk -F= '{ print $2 }' | sed -e "s/$user_name/$upstream_name/"`
if [ $? -ne 0 ]; then
	echo "git remote add upstream failed: $?"
	exit 1
fi

# list all config
git config -l
