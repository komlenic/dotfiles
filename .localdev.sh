#!/usr/bin/env bash
#
# User-specific shell commands can be placed in this file and will be executed
# after bootstrap.sh provisioning steps -- that is to say, they will be
# executed last.  Generally this is a good place to include steps to set up
# personal preferences, such as vim configuration files or other settings.
#
# USAGE INSTRUCTIONS:
#
# This (essentially blank) file is distributed with the 'localdev' repository
# as a template, but to use it you must copy it to the directory that contains
# the 'localdev' directory.  For example, assume that you have installed a
# working copy of the 'localdev' repository in your home directory, ~/localdev.
# '.localdev.sh' (this file) should be copied to your home directory, so that
# it resides "alongside" the localdev directory.  This can typically be
# accomplished on Mac/Linux with:
#
# cp ~/localdev/.localdev.sh ~/
#
# The motivation for moving this file up one directory from the 'localdev'
# directory is to ensure that your personal configuration instructions are
# preserved, and are not accidentally committed to the localdev repository.

# Exit script on error.
set -e

# Print commands and args as they are executed.
set -x

echo "Beginning user-specific provisioning..."

# Place your own user-specific provisioning instructions below:

cd /home/vagrant
if [ ! -d "dotfiles" ]; then
  git clone https://github.com/komlenic/dotfiles.git
  cd dotfiles
  echo 'y' | ./makesymlinks.sh
else
  echo "'dotfiles' directory already exists, attempting update..."
  cd dotfiles
  git pull
fi
