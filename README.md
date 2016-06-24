# Dotfiles

http://github.com/komlenic/dotfiles

komlenic@gmail.com

Like everyone's dotfiles, mostly this repository is just for me to easily
clone and use.  It also enables me to pass along a link to someone else and
share something I use, and you might find something interesting here also.

## Installation

Run './install_all.sh'.  This basically just runs 'stow' for all directories
in this repo. If you only need/want to use a particular set of dotfiles, say,
just the bash stuff, simply run:

```bash
cd ~/dotfiles
stow bash
```

## Notes

* Vim plugins that I use are all installed using Pathogen
  https://github.com/tpope/vim-pathogen

  At present, all of these are cloned using git into .vim/bundles and then the
  .git directories are deleted.  This allows all the plugins to come along for
  the ride when the dotfiles repo is cloned, without using git submodules or
  subtrees.  If I need to upgrade a vim plugin, I simply delete the plugin's
  folder, re-clone it, delete its .git directory, and commit the changes to the
  dotfiles repo.

* PHP code sniffer is required to use the Drupal code standards (included in
  the 'coder' module directory).  Generally this can be setup by:

  ```bash
  pear install PHP_CodeSniffer
  phpcs --version  #just to test if it installed correctly
  ln -sv ~/coder/coder_sniffer/Drupal $(pear config-get php_dir)/PHP/CodeSniffer/Standards
  ```

* I've got some sublimetext configs in the .sublimetext directory.  This isn't
  setup correctly to be put in place via 'stow'.  It's in a hidden directory so
  as to not automatically be installed when running 'install_all.sh'.
