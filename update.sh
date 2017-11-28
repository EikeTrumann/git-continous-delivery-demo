#!/bin/bash
basename=$(dirname $BASH_SOURCE)
cd $basename
# do not activate in programming environments
# git reset --HARD
git pull --rebase >> update.log