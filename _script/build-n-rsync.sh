#!/usr/bin/env bash

#####################################################################################
# Script to automate the updating of your personal photo-stream site.
# This script requires the bash environment and access to bundle with Jekyll & rsync
# If you want to use it, move it to the root of the photo-stream directory.
# Run it everytime when you have added photos to the photos/original directory
####################################################################################

echo 'Checking prerequisites.'

command -v bundle >/dev/null 2>&1 || { echo >&2 "I require bundle but it's not installed.  Aborting."; exit 1; } 
command -v rsync >/dev/null 2>&1 || { echo >&2 "I require rsync but it's not installed.  Aborting."; exit 1; }

echo 'Now building your site ... this can take a while.'

bundle exec Jekyll build > /dev/null

# This command requires an active working rsync server on the other side. Please check with your ISP/Host if they allow this.
# Fill in username (you need to be able to SSH with this user!), the hostname & folder that you want your site in. This can be eg. ~/public_html
# The trailing / is required - otherwise it uploads the files into a directory called _site on your server.
# It cleans up after itself. If you decide to remove photos from the photos/original -- they will also be removed from the server.

echo 'Ready. Time to sync.'

rsync -avh --delete _site/ foo@foo.bar:~/public_html/ 
