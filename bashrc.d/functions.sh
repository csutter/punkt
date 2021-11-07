# r(): Jump to repo directory
function r() {
  cd "$HOME/repos/$1"
}
complete -W "$(ls $HOME/repos)" r
