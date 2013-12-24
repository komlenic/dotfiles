#!/usr/bin/env bash

# Store the filename of the executing script.
this=`basename $0`
filelist=`ls -A`

echo "This script will rm -rf any already-present files in your home directory.  Continue? (y/n)"
read a
if [[ $a == "Y" || $a == "y" ]]
  then
    # For each filename that doesn't match the executing script name
    # or '.git', create a symlink in the executing user's home dir.
    for file in $filelist
    do
      if [ "$file" != "$this" -a "$file" != ".git" ]
        then
          echo "Symlinking: $file"
          rm -rf "$HOME/$file"
          ln -s "dotfiles/$file" "$HOME/$file"
        fi
    done
  # Might as well go ahead and source the new .bashrc.
  source "$HOME/.bashrc"
  fi

