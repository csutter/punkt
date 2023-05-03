# r(): Jump to Developer (repos) directory
function r() {
  cd "$HOME/Developer/$1"
}
[ -d $HOME/Developer ] && complete -W "$(ls $HOME/Developer)" r
