# `kubectl` completion
# TODO: Find a better way than dynamically doing this on every new shell
source <(kubectl completion bash)

# r(): Jump to repos directory
function r() {
  cd "$HOME/Developer/$1"
}
[ -d $HOME/Developer ] && complete -W "$(ls $HOME/Developer)" r
