# tm(): Create or attach to named tmux session
tm() {
  if [ -z "$1" ]; then
    echo "Usage: tm <session-name>"
    return 1
  fi

  if tmux has-session -t "$1" 2>/dev/null; then
    tmux attach -t "$1"
  else
    tmux new -s "$1"
  fi
}

_tmux_sessions() {
  local sessions=$(tmux list-sessions -F "#S" 2>/dev/null)
  COMPREPLY=( $(compgen -W "$sessions" -- "${COMP_WORDS[COMP_CWORD]}") )
}

complete -F _tmux_sessions tm
