# Prompt
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' stagedstr '%F{green}+%f'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}+%f'
zstyle ':vcs_info:*' formats "[%b%m%u%c]"
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
+vi-git-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
     git status --porcelain | grep -m 1 '^??' &>/dev/null
  then
    hook_com[misc]='%F{red}?%f'
  fi
}
precmd() { vcs_info }
PROMPT='%B%2~%b${vcs_info_msg_0_}%# '

# Colours
autoload -U colors
colors

# History
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

# Use emacs-style keybindings
bindkey -e

# Improved CD options
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Improved completion
setopt menu_complete

# Extended globbing
setopt extendedglob

# Disable nomatch warning
unsetopt nomatch

# Completion
zstyle :compinstall filename '~/.zshrc'
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' special-dirs true

# r() - jump to repos directory
r() {
  cd ~/repos/$1
}
compctl -/ -W ~/repos c

# Load aliases
source "$HOME/.zshrc.d/aliases.zsh"

# Load platform-specific settings
if [ -f "$HOME/.zshrc.d/platform_specific.zsh" ]; then
  source "$HOME/.zshrc.d/platform_specific.zsh"
fi
