# Ensure possible Homebrew directories are in PATH
pathmunge "/opt/homebrew/bin" # arm64
pathmunge "/usr/local/bin" # x86

# Load Homebrew shell environment
eval $(brew shellenv)

# Load bash completions
if [ -f $HOMEBREW_PREFIX/etc/bash_completion ]; then
. $HOMEBREW_PREFIX/etc/bash_completion
fi
