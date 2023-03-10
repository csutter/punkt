# Some devcontainers may run as root/superuser and not have sudo available
CONDITIONAL_SUDO=''
if (( $EUID != 0 )); then
    CONDITIONAL_SUDO='sudo'
fi

if grep Debian /etc/os-release > /dev/null; then
  echo "Bootstrapping dotfiles for Debian-based systems"

  # Install an updated git version from backports (bullseye ships with Git 2.30 which is too old to
  # support Git commit signing with SSH keys, which is a part of my workflow)
  echo "deb http://deb.debian.org/debian bullseye-backports main" | $CONDITIONAL_SUDO tee /etc/apt/sources.list.d/bullseye-backports.list
  $CONDITIONAL_SUDO apt update
  $CONDITIONAL_SUDO apt install -y git/bullseye-backports

  # Install rcm and additional software packages
  $CONDITIONAL_SUDO apt install -y rcm fzf git-extras gnupg2 tree

  # Install dotfiles using RCM
  rm $HOME/.rcrc || true
  cp $DOTFILES_DIR/rcrc/rcrc.devcontainer $HOME/.rcrc
  rcup -f
elif grep -e Ubuntu /etc/os-release > /dev/null; then
  echo "Bootstrapping dotfiles for Ubuntu-based systems"

  # Install rcm and additional software packages
  $CONDITIONAL_SUDO apt install -y rcm fzf git-extras gnupg2 tree

  # Install dotfiles using RCM
  rm $HOME/.rcrc || true
  cp $DOTFILES_DIR/rcrc/rcrc.devcontainer $HOME/.rcrc
  rcup -f
else
  echo "Unsupported operating system"
fi
