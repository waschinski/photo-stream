#!/usr/bin/env bash

#####################################################################################
# Script to automate building your personal photo-stream site.
# This script requires the bash environment and access to bundle with Jekyll
# Run it everytime when you have added photos to the photos/original directory
####################################################################################

DIRECTORY=$(cd `dirname $0` && pwd)
cd $DIRECTORY/..

echo 'Checking prerequisites.'

command -v bundle >/dev/null 2>&1 || { echo >&2 "I require bundle but it's not installed.  Aborting."; exit 1; } 
command -v rsync >/dev/null 2>&1 || { echo >&2 "I require rsync but it's not installed.  Aborting."; exit 1; }

echo 'Now building your site ... this can take a while.'

bundle exec jekyll build > /dev/null

echo 'Ready.'
