echo "Bootstrapping dotfiles for macOS"

# Ensure Homebrew environment is in place
eval "$(brew shellenv)"

# Set up rcrc
rm $HOME/.rcrc || true
cp $HOME/Developer/punkt/rcrc/rcrc.macos $HOME/.rcrc

# Install dotfiles
rcup -f

# Set up bash completion from Docker.app
[ -f $HOMEBREW_PREFIX/etc/bash_completion.d/docker.bash-completion ] || \
      ln -s /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion \
      $HOMEBREW_PREFIX/etc/bash_completion.d
[ -f $HOMEBREW_PREFIX/etc/bash_completion.d/docker-compose.bash-completion ] || \
      ln -s /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion \
      $HOMEBREW_PREFIX/etc/bash_completion.d

# Change macOS shell to Homebrew bash
HOMEBREW_BASH="$HOMEBREW_PREFIX/bin/bash"
if !(grep $HOMEBREW_BASH /etc/shells > /dev/null); then
  echo "Changing shells to '$HOMEBREW_BASH', password will be required..."
  echo $HOMEBREW_BASH | sudo tee /etc/shells
  chsh -s $HOMEBREW_BASH
fi
