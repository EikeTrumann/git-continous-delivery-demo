#!/bin/bash
basename=$(dirname $BASH_SOURCE)
cd $basename
echo "========== update.sh  ========== " >> update.log
date >> update.log
# do not activate in programming environments
# git reset --HARD
echo fetch >> update.log
git fetch >> update.log
commitahead=$(git rev-list HEAD...origin/master --count)
if (($commitahead != 0))
	then
	./before_update.sh >> update.log
	git rebase >> update.log
	./after_update.sh >> update.log
fi
