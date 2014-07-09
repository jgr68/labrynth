#!/bin/bash

# -r <repo> repo_name
# -g <git_username> git_user
#
#
#

usage() {

	echo "Usage: $0 [-r <dotfiles git repo>] [-g <git username>] 1>&2";
	exit 1;
}

while getopts "r:g:" opt; do

	case $opt in
		r)
			echo "-r was triggered"
			repo_name=$OPTARG
			;;
		g)
			echo "-g was triggered"
			git_user=$OPTARG
			;;
		*)
			usage
			;;
	esac
done

if [[ -z $repo_name ]] || [[ -z $git_user ]]; then
	
	usage;
	exit 1;
fi

echo "You selected repo_name: $repo_name"
echo "You selected git_user: $git_user"

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
rm -rf ".git"

working_dir=`pwd`
echo "We are now in $working_dir";
pwd

cd

find ".dotfiles" -type f -exec ln -sf {} \;
