# Source .bashrc
source ~/.bashrc
# Source .bash_aliases
source ~/.bash_aliases
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

export GOPATH=$HOME/work
# prompt
PS1="$ "

# export useful variables
export NODE_ENV=DEV
export EDITOR=emacs
