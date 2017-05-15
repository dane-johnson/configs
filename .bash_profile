# OSX specific stuff

# Source .bashrc, OSX doesn't by default
. "$HOME/.bashrc"
# ls --color doesn't work on OSX, but this is similar
export CLICOLOR=1
# Still want color grepping
alias grep='grep --color'
