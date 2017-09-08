#!/bin/bash
# Branch Removing Tool

printf "\n[ Branch Removing Tool ] \n\n"
printf "Removing old branchs from your local copy\n\n"

CUR_BRANCH=`git rev-parse --abbrev-ref HEAD`;
BRANCHS="`git branch | grep -v 'help' | grep -v 'development' | grep -v 'master' | grep -v '$CUR_BRANCH'`"

printf "> Notice: current branch '$CUR_BRANCH' will not be removed. \n\n"

if [ -z "$BRANCHS" ]; then
	printf "> No other branchs were found. Local copy is clear\n\n";
	printf "> Exiting.\n\n"
	exit;
fi


function remove_branchs() {
	while read -r branch; do
		git branch -D $branch
	done <<< "$BRANCHS"
	printf "> All done. Goodbye. \n\n"
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
