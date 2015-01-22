#!/bin/bash

# Git config
# user name
echo "Please input your git user name:"
read user_name
git config --local user.name $user_name
if [ $? -ne 0 ]; then
	echo "git config --local user.name failed: $?"
	exit 1
fi
echo "Your git user name is:"
git config --local user.name

# user email
echo "Please input your git user email:"
read user_email
git config --local user.email $user_email
if [ $? -ne 0 ]; then
	echo "git config --local user.email failed: $?"
	exit 1
fi
echo "Your git user email is:"
git config --local user.email

# editor
echo "Please input your favorite(or familiar) editor: vim"
read editor
if [ "$editor" = "" ]; then
   editor=vim
fi   
git config --local core.editor $editor
if [ $? -ne 0 ]; then
	echo "git config --local core.editor failed: $?"
	exit 1
fi
echo "Your git editor is:"
git config --local core.editor

# merge tool
echo "Please input your favorite(or familiar) merge tool: vimdiff"
read merge_tool
if [ "$merge_tool" = "" ]; then
	merge_tool=vimdiff
fi
git config --local merge.tool $merge_tool
if [ $? -ne 0 ]; then
	echo "git config --local merge.tool failed: $?"
	exit 1
fi
echo "Your git merge tool is:"
git config --local merge.tool

# color
git config --local color.ui true
if [ $? -ne 0 ]; then
	echo "git config --local color.ui failed: $?"
	exit 1
fi

# crlf
git config --local core.autocrlf input
if [ $? -ne 0 ]; then
	echo "git config --local core.autocrlf failed: $?"
	exit 1
fi

git config --local core.safecrlf true
if [ $? -ne 0 ]; then
	echo "git config --local core.safecrlf failed: $?"
	exit 1
fi

# eol
git config --local core.eol lf
if [ $? -ne 0 ]; then
	echo "git config --local core.eol failed: $?"
	exit 1
fi

# credential
git config --local credential.help cache
if [ $? -ne 0 ]; then
	echo "git config --local credential.help failed: $?"
	exit 1
fi

# set upstream
echo "Please input the name of the remote upstream repository: "
read upstream_name 
if [ "$merge_tool" = "" ]; then
    echo "illegal remote upstream name"
    exit 1
fi
git remote add upstream `git config --local --list | grep origin.url | awk -F= '{ print $2 }' | sed -e "s/$user_name/$upstream_name/"`
if [ $? -ne 0 ]; then
	echo "git remote add upstream failed: $?"
	exit 1
fi

# list all config
git config --local --list
