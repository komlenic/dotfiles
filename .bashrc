# .bashrc
# If git bash completion is present, use it.
if [ -e "$HOME/.git-completion.sh" ]; then
  source "$HOME/.git-completion.sh"
  export GIT_PS1_SHOWDIRTYSTATE=
  export GIT_PS1_SHOWUNTRACKEDFILES=
  export GIT_PS1_SHOWUPSTREAM=
fi

# Promt.
if [ ! -z "$PS1" ]; then
  export PS1="\[$(tput bold)\]\[$(tput setaf 2)\]\u@\h\[$(tput setaf 3)\]\[ \]\w\[$(tput setaf 1)\]\$(__git_ps1) \n\[$(tput setaf 7)\]\\$\[ \]\[$(tput sgr0)\]"
fi

# Setup some common commands with desired options.
alias grep='grep --color=auto'
alias ll='ls -lah --color=auto'

# Long listing + less: easy scrolling through a long directory listing.
function lll() {
  ls -lah --color=always "${1-`pwd`}" | less -R
}

# Long listing + grep: easy searching through a long directory listing.
function llg() {
  ls -lah --color=always "${2-`pwd`}" | grep -i "${1}"
}

# Alias 'thefuck', see: https://github.com/nvbn/thefuck
alias fuck='$(thefuck $(fc -ln -1))'

# Extract nearly any type of archive.  This is okay where needed, but dtrx aka
# "do the right extraction" tool is superior if available.
extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar e $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)     echo "'$1' cannot be extracted via extract()" ;;
      esac
   else
     echo "'$1' is not a valid file"
   fi
}

# Turn on some spelling autocorrection
shopt -s cdspell

# Search the googles from the terminal.
function google() {
  search="$@"
  nohup xdg-open "http://www.google.com/search?q=$search" > /dev/null 2>&1 &
} &> /dev/null

# make cursor jump over words
if [ -t 1 ]
then
  bind '"\e[5C": forward-word'    # control+arrow_right
  bind '"\e[5D": backward-word'   # control+arrow_left
fi

# Make history searchable by entering the beginning of command
# and using up and down keys.
if [ -t 1 ]
then
  bind '"\e[A": history-search-backward'  # arrow_up
  bind '"\e[B": history-search-forward'   # arrow_down
fi

# Use a better 'cd' function with history.
# See http://www.tldp.org/LDP/LGNET/109/marinov.html
source ~/dotfiles/acd_func.sh

# Load screenfetch.
if [ "$HOSTNAME" = "E7250-LM17" ]
then
  ~/screenFetch/screenfetch-dev
fi
