#!/usr/bin/env bash

#####################################################################################
# Script to automate updating your personal photo-stream site.
# This script requires the bash environment and rsync
# Run it everytime when you want to sync to your server or webhosting provider
#####################################################################################

# This command requires an active working rsync server on the other side. Please check 
# with your ISP/Host if they allow this.
# It cleans up after itself. If you decide to remove photos from the photos/original
# they will also be removed from the server.

DIRECTORY=$(cd `dirname $0` && pwd)
cd $DIRECTORY/..

echo 'Time to sync.'

rsync -avh -e 'sshpass -p "$SYNCPASS" ssh -p 48180 -o StrictHostKeyChecking=no' --delete _site/ $SYNCUSER@$SYNCSERVER:$SYNCFOLDER
