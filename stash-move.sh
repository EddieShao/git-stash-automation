#!/bin/bash

if [ `git branch --list $1` ]
then
    stashed="$(git stash create)"
    git reset --hard
    git checkout $1
    git pull
    
    if [ -n "${stashed}" ]
    then
        git stash apply "${stashed}"
    fi
    
    echo "Moved stash to branch $1"
else
    echo "Branch $1 doesn't exist or is the current branch. Aborting."
fi
