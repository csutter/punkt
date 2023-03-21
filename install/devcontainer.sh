# Some devcontainers may run as root/superuser and not have sudo available
CONDITIONAL_SUDO=''
if (( $EUID != 0 )); then
    CONDITIONAL_SUDO='sudo'
fi

if grep Debian /etc/os-release > /dev/null; then
  echo "Bootstrapping dotfiles for Debian-based systems"

  # Allow for installing an updated git version from backports (bullseye ships with Git 2.30 which
  # is too old to support Git commit signing with SSH keys, which is a part of my workflow)
  echo "deb http://deb.debian.org/debian bullseye-backports main" | $CONDITIONAL_SUDO tee /etc/apt/sources.list.d/bullseye-backports.list
  $CONDITIONAL_SUDO apt update

  $CONDITIONAL_SUDO apt install -y git/bullseye-backports rcm fzf git-extras gnupg2 tree
elif grep -e Ubuntu /etc/os-release > /dev/null; then
  echo "Bootstrapping dotfiles for Ubuntu-based systems"

  $CONDITIONAL_SUDO apt install -y rcm fzf git-extras gnupg2 tree
else
  echo "Unsupported operating system"
  exit 1
fi

# Install dotfiles using RCM
rm $HOME/.rcrc || true
cp $DOTFILES_DIR/rcrc/rcrc.devcontainer $HOME/.rcrc
rcup -f

# Disable Git safe directory checking
#   This is a check introduced for a specific Git vulnerability on multi-user systems, ensuring that
#   any git repo directory is either allowlisted in `safe.directory` or owned by the current user,
#   that isn't relevant within a devcontainer running only a single project at a time (and causes
#   git commands to fail due to dubious ownership when mounted into the Colima VM)
git config --global --add safe.directory "*"
