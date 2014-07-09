#!/bin/bash

# get git information
repo_name="dotfiles"
git_user="jgr68"
repo_url="git@github.com:$git_user/$repo_name.git"

# change directory to home
echo "Changing directory to home."
cd 
working_dir=`pwd`
echo "We are now in $working_dir"

# remove existing directories
rm -rf "$repo_name"
rm -rf ".dotfiles"

# clone the dotfiles repo
git clone "$repo_url"

# move the dotfiles repo to .dotfiles
yes | mv "$repo_name" ".dotfiles"

cd ".dotfiles"

# get rid of the readme file
rm "README.md"

working_dir=`pwd`
echo "We are now in $working_dir";
pwd

ln -sf * ~/
