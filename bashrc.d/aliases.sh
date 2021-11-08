# Shell
alias sup="source $HOME/.bashrc && echo 'Reloaded bashrc.'"

# Directories
alias l="ls"
alias ll="ls -al"

# Git
source $DISTRO_GIT_COMPLETION # Required for __git_complete
alias g="git"
__git_complete g _git_main
alias ga="git add"
alias gb="git branch"
__git_complete gb _git_branch
alias gc="git commit"
alias gcm="git commit -m"
alias gco="git checkout"
__git_complete gco _git_checkout
alias gd="git diff"
__git_complete gd _git_diff
alias gds="git diff --staged"
alias gg="git grep"
alias gl="git log"
alias gp="git push"
__git_complete gp _git_push
alias gpp="git pp"
alias gst="git status -sb"
alias gu="git pull"
__git_complete gu _git_pull

# Tools
alias be="bundle exec"
alias tf="terraform"
