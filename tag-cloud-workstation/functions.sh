# r(): Jump to repos directory
function r() {
  cd "$HOME/repos/$1"
}
[ -d $HOME/repos ] && complete -W "$(ls $HOME/repos)" r
