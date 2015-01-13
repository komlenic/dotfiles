dotfiles
http://github.com/komlenic/dotfiles
komlenic@gmail.com

Like everyone's dotfiles, mostly this repository is just for me to easily
clone and use.  It also enables me to pass along a link to someone else and
share something I use, and you might find something interesting here also.

INSTALLATION:

Run './makesymlinks.sh'.  This will overwrite any existing dotfiles with the
same names that already exist in your home directory.

OTHER INSTALLATION NOTES:

- Vim plugins that I use are all installed using Pathogen
  https://github.com/tpope/vim-pathogen

  At present, all of these are cloned using git into .vim/bundles and then the
  .git directories are deleted.  This allows all the plugins to come along for
  the ride when the dotfiles repo is cloned, without using git submodules or
  subtrees.  If I need to upgrade a vim plugin, I simply delete the plugin's
  folder, re-clone it, delete its .git directory, and commit the changes to the
  dotfiles repo.

- PHP code sniffer is required to use the Drupal code standards (included in
  the 'coder' module directory).  Generally this can be setup by:

  pear install PHP_CodeSniffer
  phpcs --version #just to test if it installed correctly
  ln -sv ~/coder/coder_sniffer/Drupal $(pear config-get \
  php_dir)/PHP/CodeSniffer/Standards

- Generally this has all been tested on Linux (ubuntu/mint) and cygwin on
  Windows.  Mac has not been tested, ymmv.

TODO:

- put this thing on github instead of bitbucket.  It was only on bitbucket
  so that it could be private, and we don't need that.
- ensure that the prompt only uses the fancy git stuff if it can
- consider refactoring makesymlinks.sh to only symlink files starting with a
  '.' that aren't .git or .gitignore
- source and install some more better vim themes

