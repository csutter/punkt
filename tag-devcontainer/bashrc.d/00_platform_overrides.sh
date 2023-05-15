# Tool locations for Debian/Ubuntu devcontainers (sourced in the non-tagged Bash setup scripts)
export DISTRO_GIT_COMPLETION=/usr/share/bash-completion/completions/git
export DISTRO_GIT_PROMPT=/usr/lib/git-core/git-sh-prompt
export DISTRO_FZF_KEY_BINDINGS=/usr/share/doc/fzf/examples/key-bindings.bash

# Use VS Code as the default editor in devcontainers
export EDITOR="code --wait"

# Customise PS1 to show we're in a container
export PROMPT_PREFIX="  "
