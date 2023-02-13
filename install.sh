#!/bin/bash
set -e

DOTFILES_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo "Dotfiles are in '$DOTFILES_DIR'"

if uname -a | grep Darwin > /dev/null; then
  if uname -a | grep arm64 > /dev/null; then
    echo "Bootstrapping dotfiles for macOS (arm64)"

    # Ensure Homebrew is loaded
    eval "$(/opt/homebrew/bin/brew shellenv)"

    # Install RCM first
    brew install rcm

    # Set up rcrc
    rm $HOME/.rcrc || true
    ln -s $HOME/Developer/punkt/rcrc/rcrc.macos.arm64 $HOME/.rcrc
  else
    echo "Bootstrapping dotfiles for macOS (x86)"

    # Ensure Homebrew is loaded
    eval "$(/usr/local/bin/brew shellenv)"

    # Install RCM first
    brew install rcm

    # Set up rcrc
    rm $HOME/.rcrc || true
    ln -s $HOME/Developer/punkt/rcrc/rcrc.macos.x86 $HOME/.rcrc
  fi

  # Install dotfiles
  rcup -f

  # Install remaining Homebrew dependencies
  brew bundle --file $HOME/Brewfile

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
elif grep Debian /etc/os-release > /dev/null; then
  echo "Bootstrapping dotfiles for Debian-based systems"

  # Install an updated git version from backports (bullseye ships with Git 2.30 which is too old to
  # support Git commit signing with SSH keys, which is a part of my workflow)
  echo "deb http://deb.debian.org/debian bullseye-backports main" | sudo tee /etc/apt/sources.list.d/bullseye-backports.list
  sudo apt update
  sudo apt install -y git/bullseye-backports

  # Install rcm and additional software packages
  sudo apt install -y rcm fzf git-extras gnupg2 tree

  # Install dotfiles using RCM
  rm $HOME/.rcrc || true
  ln -s $DOTFILES_DIR/rcrc/rcrc.devcontainer $HOME/.rcrc
  rcup -f
elif grep -e Ubuntu /etc/os-release > /dev/null; then
  echo "Bootstrapping dotfiles for Ubuntu-based systems"

  # Install rcm and additional software packages
  sudo apt install -y rcm fzf git-extras gnupg2 tree

  # Install dotfiles using RCM
  rm $HOME/.rcrc || true
  ln -s $DOTFILES_DIR/rcrc/rcrc.devcontainer $HOME/.rcrc
  rcup -f
else
  echo "Unsupported operating system"
fi
