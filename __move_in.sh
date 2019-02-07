#!/bin/bash

(
homeDir="$1"
if [ ! -d "$homeDir" ]; then
  exec 1>&2
  echo "usage: $0 <HOME_DIR>"
  exit
fi

scriptsDir='scripts'
bashSetupFile='.bash_setup.sh'

if [ ! -d "$scriptsDir" ] || [ ! -f "$bashSetupFile" ]; then
  exec 1>&2
  echo 'Either scripts directory or bash setup script is missing.'
  exit
fi

echo -n "Checking for existing scripts dir in '$homeDir' ... "
if [ -d "$homeDir"/"$scriptsDir" ]; then
  echo "Merging scripts into existing directory."
  ( set -x && cp -r "$scriptsDir"/* "$homeDir"/"$scriptsDir" )
else
  echo "Creating new scripts directory."
  ( set -x && cp -r "$scriptsDir" "$homeDir" )
fi

echo -n "Checking for existing bash setup script in '$homeDir' ... "
if [ -f "$homeDir"/"$bashSetupFile" ]; then
  echo "Backing up existing file."
  ( set -x && mv "$homeDir"/"$bashSetupFile" "$homeDir"/"$bashSetupFile"-$(date +"%s").bak.sh )
else
  echo "No existing file found."
fi
echo "Copying fresh bash setup file."
( set -x && cp "$bashSetupFile" "$homeDir" )

echo "Make sure to put the following in your"
echo ".bash_profile or .bashrc as appropriate:"
echo ""
echo 'if [ -f ~/.bash_setup.sh ]; then'
echo '    . ~/.bash_setup.sh 1>&2'
echo 'fi'
echo ""
)

