# Tool locations (sourced in the non-tagged Bash setup scripts)
export DISTRO_GIT_COMPLETION=$HOMEBREW_PREFIX/etc/bash_completion.d/git-completion.bash
export DISTRO_GIT_PROMPT=$HOMEBREW_PREFIX/etc/bash_completion.d/git-prompt.sh
export DISTRO_FZF_KEY_BINDINGS=$HOMEBREW_PREFIX/opt/fzf/shell/key-bindings.bash

# Disable Homebrew analytics
export HOMEBREW_NO_ANALYTICS=1

# Enable ls colours
export CLICOLOR=1

# Set up TTY for GPG agent
export GPG_TTY=$(tty)

# Use VS Code as the default editor
export EDITOR=code

# Load bash completions
if [ -f $HOMEBREW_PREFIX/etc/bash_completion ]; then
. $HOMEBREW_PREFIX/etc/bash_completion
fi
