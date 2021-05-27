#!/usr/bin/env bash

#####################################################################################
# Script to automate updating your personal photo-stream site.
# This script requires the bash environment and lftp
# Run it everytime when you want to sync to your server or webhosting provider
#####################################################################################

# This command requires access to your webhosting space via one of the supported
# protocols (e.g. FTP or FTPS). Please check with your ISP/Host if they allow this.
# It cleans up after itself. If you decide to remove photos from the photos/original
# they will also be removed from the server.

DIRECTORY=$(cd `dirname $0` && pwd)
cd $DIRECTORY/..

echo 'Time to sync.'

command="open -e \"mirror -R $DIRECTORY/../_site $SYNCFOLDER\" \"$SYNCUSER:$SYNCPASS@$SYNCSERVER\""
lftp -c "$command"
