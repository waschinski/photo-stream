#!/usr/bin/env bash

#####################################################################################
# Script to automate the updating of your personal photo-stream site.
# This script requires the bash environment and access to bundle with Jekyll & rsync
# Run it everytime when you have added photos to the photos/original directory and
# you want to sync to your server or webhosting provider
#####################################################################################

DIRECTORY=$(cd `dirname $0` && pwd)
cd $DIRECTORY

sh ./build.sh
sh ./rsync.sh
