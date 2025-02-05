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

# 1Password SSH agent
## Setting it in `.ssh/config` isn't enough for it to get picked up by Git
export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"

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
## Colors
reset="\[$(tput sgr0)\]"
bold="\[$(tput bold)\]"
blue="\[$(tput setaf 4)\]"

## Configuration
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWCOLORHINTS=1
GIT_PS1_FORMAT=" (%s)"
PROMPT_DIRTRIM=2
DIRENV_PS1='${DIRENV_DIR:+('"$blue"'%'"$reset"')}'

## Set prompt
PS1="\u@\h:${bold}\w${reset}\$(__git_ps1)${DIRENV_PS1}\\$ "

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
  : "${PUNKT_PROJECT_BUILD_COMMAND:?must be set}"
  eval "${PUNKT_PROJECT_BUILD_COMMAND}"
}

## xr(): Run a command in an execution environment for the current project
function xr() {
  : "${PUNKT_PROJECT_RUN_WRAPPER:?must be set}"
  local cmd=$(printf "${PUNKT_PROJECT_RUN_WRAPPER}" "${@}")
  eval "${cmd}"
}

## xs(): Run a server for the current project
function xs() {
  : "${PUNKT_PROJECT_SERVE_COMMAND:?must be set}"
  eval "${PUNKT_PROJECT_SERVE_COMMAND}"
}

## xt(): Run the tests for the current project
function xt() {
  : "${PUNKT_PROJECT_TEST_COMMAND:?must be set}"
  eval "${PUNKT_PROJECT_TEST_COMMAND}"
}

## xci(): Run the full CI suite for the current project
function xci() {
  : "${PUNKT_PROJECT_CI_COMMAND:?must be set}"
  eval "${PUNKT_PROJECT_CI_COMMAND}"
}

# Aliases
source $HOME/.aliases

# direnv
## Load direnv _last_ as setting up other things after can cause headaches
export DIRENV_LOG_FORMAT=
eval "$(direnv hook bash)"
