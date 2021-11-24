#!/bin/bash

DOTFILES_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo "Dotfiles are in '$DOTFILES_DIR'"

if uname -a | grep Darwin > /dev/null; then
  echo "Bootstrapping dotfiles for macOS"

  # Install RCM first
  brew install rcm

  # Install dotfiles using RCM
  rm $HOME/.rcrc
  ln -s $HOME/repos/punkt/rcrc/rcrc.macos $HOME/.rcrc
  rcup -f

  # Install remaining Homebrew dependencies
  brew bundle --file $HOME/Brewfile

  # Set up bash completion from Docker.app
  ln -s /Applications/Docker.app/Contents/Resources/etc/docker.bash-completion \
        /usr/local/etc/bash_completion.d
  ln -s /Applications/Docker.app/Contents/Resources/etc/docker-compose.bash-completion \
        /usr/local/etc/bash_completion.d
elif grep Debian /etc/os-release > /dev/null; then
  echo "Bootstrapping dotfiles for Debian-based systems"

  # Install rcm
  sudo apt update
  sudo apt install -y rcm

  # Install dotfiles using RCM
  rm $HOME/.rcrc
  ln -s $DOTFILES_DIR/rcrc/rcrc.devcontainer $HOME/.rcrc
  rcup -f

  # Install any additional software that I need
  sudo apt install -y fzf git-extras gnupg2 tree
elif grep Fedora /etc/os-release > /dev/null; then
  echo "Bootstrapping dotfiles for Fedora systems"

  # Install rcm
  sudo dnf install -y rcm

  # Install dotfiles using RCM
  rm $HOME/.rcrc
  ln -s $DOTFILES_DIR/rcrc/rcrc.devcontainer $HOME/.rcrc
  rcup -f

  # Install any additional software that I need
  sudo dnf install -y fzf git-extras gnupg2 tree
else
  echo "Unsupported operating system"
fi
