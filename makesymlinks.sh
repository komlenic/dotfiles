#!/usr/bin/env bash

# Store the filename of the executing script.
this=`basename $0`
filelist=`ls -A`

echo "This script will overwrite existing dotfiles.  Continue? (y/n)"
read a
if [[ $a == "Y" || $a == "y" ]]
  then
    # For each filename that doesn't match the executing script name
    # or '.git', create a symlink in the executing user's home dir.
    # This will include directories.
    for file in $filelist
    do
      if [ "$file" != "$this" -a "$file" != ".git" -a "$file" != ".gitignore" ]
        then
          rm -rf "$HOME/$file"
          ln -sv "dotfiles/$file" "$HOME/$file"
        fi
    done
  # Might as well go ahead and source the new .bashrc.  Note that this will
  # not really take effect in the current shell instance without manually
  # typing 'source .bashrc'.
  source ".bashrc"
  fi

