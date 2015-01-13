# .bashrc

# If git bash completion is present, use it.
if [ -f ".git-completion.sh" ]; then
  source .git-completion.sh
  export GIT_PS1_SHOWDIRTYSTATE=1
  export GIT_PS1_SHOWUNTRACKEDFILES=1
  export GIT_PS1_SHOWUPSTREAM="auto verbose"
fi

# Promt.
if [ ! -z "$PS1" ]; then
  export PS1="\[$(tput bold)\]\[$(tput setaf 2)\]\u@\h\[$(tput setaf 3)\]\[ \]\w\[$(tput setaf 1)\]\$(__git_ps1 ' (%s)') \n\[$(tput setaf 7)\]\\$\[ \]\[$(tput sgr0)\]"
fi

# Setup some common commands with desired options
alias grep='grep --color=auto'
alias ll='ls -lah --color=auto'
alias lll='ll | less'

# Extract nearly any type of archive.  This is great but also remember that the
# utility 'unp' can also be installed and does the same thing.
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

