echo "Bootstrapping dotfiles for macOS"

# Ensure Homebrew environment is in place
pathmunge "/opt/homebrew/bin" # arm64
pathmunge "/usr/local/bin" # x86
eval "$(brew shellenv)"

# Set up rcrc
rm $HOME/.rcrc || true
cp $HOME/Developer/punkt/rcrc/rcrc.macos $HOME/.rcrc

# Install dotfiles
rcup -f
