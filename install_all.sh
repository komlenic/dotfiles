#!/usr/bin/env bash

# Abort if stow is not installed.
command -v stow >/dev/null 2>&1 || { echo "This script requires 'stow' but it is not installed.  Aborting." >&2; exit 1; }

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
