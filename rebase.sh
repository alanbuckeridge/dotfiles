#!/bin/sh

# Rebase a branch against master
#   1. Check out master and get the latest code
#   2. Change back to original branch and rebase against master
#
# 20150213 Alan Buckeridge


# Cause script to exit if any command fails
set -e

BRANCH=`git status | cut -f 3 -d' ' | head -1`

echo Rebasing $BRANCH ...
echo
 
git checkout master
git fetch origin --prune
git merge -v origin/master
git checkout $BRANCH
git rebase -v master 

