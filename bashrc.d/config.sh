# Expand variables when completing directories; append history
shopt -s direxpand histappend

# Infinite history; ignorespace+ignoredup
HISTSIZE=-1
HISTFILESIZE=-1
HISTCONTROL='ignoreboth'

# Prompt
source $DISTRO_GIT_PROMPT

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWCOLORHINTS=1
PROMPT_DIRTRIM=2
reset="\[$(tput sgr0)\]"
bold="\[$(tput bold)\]"

[ -z ${PROMPT_PREFIX+x} ] && export PROMPT_PREFIX="\u@\h:" # Set default prompt prefix if unset
PROMPT_COMMAND='__git_ps1 "$PROMPT_PREFIX$bold\w$reset" "\\\$ "'

# Fzf key bindings
[ -f $DISTRO_FZF_KEY_BINDINGS ] && source $DISTRO_FZF_KEY_BINDINGS
