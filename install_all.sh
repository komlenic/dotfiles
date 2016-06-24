#!/usr/bin/env bash

# Store the filename of the executing script.
this=`basename $0`
dirlist=`ls -d */`

echo "This script will overwrite existing dotfiles.  Continue? (y/n)"
read a
if [[ $a == "Y" || $a == "y" ]]
  then
    # For each filename that doesn't match the executing script name
    # or '.git', create a symlink in the executing user's home dir.
    # This will include directories.
    for dir in $dirlist
    do
      stow $dir
    done
  fi
