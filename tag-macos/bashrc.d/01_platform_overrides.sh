# Force setting Homebrew prefix (missing on x86 macOS for some reason)
export HOMEBREW_PREFIX=$(brew --prefix)

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

# Set up my retroboxer tool in PATH
pathmunge "$HOME/Developer/retroboxer/bin"

# Some tools don't properly pick up on 1Password SSH agent from `~/.ssh/config` (looking at you,
# VS Code devcontainers), set it using env variable to get them working
# cf. https://1password.community/discussion/132867/visual-studio-code-remote-development-server-and-1password-ssh-config
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

# Load bash completions
if [ -f $HOMEBREW_PREFIX/etc/bash_completion ]; then
. $HOMEBREW_PREFIX/etc/bash_completion
fi
