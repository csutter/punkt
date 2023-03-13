echo "Bootstrapping dotfiles for macOS"

# Ensure Homebrew environment is in place
eval "$(brew shellenv)"

# Set up rcrc
rm $HOME/.rcrc || true
cp $HOME/Developer/punkt/rcrc/rcrc.macos $HOME/.rcrc

# Install dotfiles
rcup -f

# Set up bash completion from Docker.app
# TODO: Set this up for Homebrew Docker instead
# [ -f $HOMEBREW_PREFIX/etc/bash_completion.d/docker.bash-completion ] || \
#       ln -s /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion \
#       $HOMEBREW_PREFIX/etc/bash_completion.d
# [ -f $HOMEBREW_PREFIX/etc/bash_completion.d/docker-compose.bash-completion ] || \
#       ln -s /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion \
#       $HOMEBREW_PREFIX/etc/bash_completion.d
