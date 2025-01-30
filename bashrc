# Configuration
## Expand variables when completing directories; append history
shopt -s direxpand histappend

## Infinite history; ignorespace+ignoredup
HISTSIZE=-1
HISTFILESIZE=-1
HISTCONTROL='ignoreboth'

# Environment
export CLICOLOR=1
export EDITOR="nvim"
export PATH="$HOME/bin:$PATH"

# Homebrew
export PATH="/opt/homebrew/bin:$PATH"
export HOMEBREW_NO_ANALYTICS=1
eval $(brew shellenv)

# Bash completion
source $HOMEBREW_PREFIX/etc/bash_completion

# Git integration
source $HOMEBREW_PREFIX/etc/bash_completion.d/git-completion.bash
source $HOMEBREW_PREFIX/etc/bash_completion.d/git-prompt.sh

# Prompt
## Configuration
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_FORMAT=" (%s)"
PROMPT_DIRTRIM=2

## Colors
reset="\[$(tput sgr0)\]"
bold="\[$(tput bold)\]"

## Set prompt
PS1="\u@\h:${bold}\w${reset}\$(__git_ps1)\\$ "

# Docker Desktop (hopefully gone soon!)
export COMPOSE_MENU=0 # disable Docker Desktop's irritating hijack of `docker-compose`
export PATH="$HOME/.docker/bin:$PATH"

# Functions
## r(): Jump to repos directory
function r() {
  cd "$HOME/Developer/$1"
}
[ -d $HOME/Developer ] && complete -W "$(ls $HOME/Developer)" r

## xb(): Build the current project
function xb() {
  : "${PUNKT_CMD_BUILD:?must be set}"
  eval "${PUNKT_CMD_BUILD} ${@}"
}

## xr(): Run a command in an execution environment for the current project
function xr() {
  : "${PUNKT_CMD_RUN:?must be set}"
  eval "${PUNKT_CMD_RUN} ${@}"
}

## xs(): Run a server for the current project
function xs() {
  : "${PUNKT_CMD_SERVE:?must be set}"
  eval "${PUNKT_CMD_SERVE} ${@}"
}

# Aliases
source $HOME/.aliases

# direnv
## Load direnv _last_ as setting up other things after can cause headaches
eval "$(direnv hook bash)"
