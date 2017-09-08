#!/bin/bash
# Branch Removing Tool

printf "Branch Removing Tool\n\n"

CUR_BRANCH=`git rev-parse --abbrev-ref HEAD`;
BRANCHS="`git branch | grep -v 'help' | grep -v 'development' | grep -v 'master' | grep -v '$CUR_BRANCH'`"

printf "Notice: $CUR_BRANCH will not be removed. \n\n"

function remove_branchs() {
	while read -r branch; do
		git branch -D $branch
	done <<< "$BRANCHS"
	printf "All done. Goodbye. \n\n"
	exit;
}

while true; do
	printf "Remove the following branchs?\n$BRANCHS\n"
	read -p "(y/n) " yn
	case $yn in
		[Yy]* ) remove_branchs	; break;;
		[Nn]* ) exit;;
		* ) echo "Please answer yes or no.";;
	esac
done
