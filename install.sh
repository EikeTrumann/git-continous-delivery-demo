#!/bin/bash
touch cron.template

# This are the parts of the crontab entry
cronbase='''* * * * *''' # Update every minute
basename=$(dirname $BASH_SOURCE)
cd $basename
basename=$(pwd)
scriptname="update.sh"

# This is the line that should be in the crontab file
echo "$cronbase $basename/$scriptname" > cron.template
crontab cron.template
rm cron.template

# Set-Uo the hooks
cp pre-rebase.hook .git/hooks/pre-rebase
cp post-rewrite.hook .git/hooks/post-rewrite

# Make the update script executable

chmod +x update.sh
