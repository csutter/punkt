#!/bin/sh
set -eu

# install.sh - Set up a devcontainer with my dotfiles and other tools
# Technically this should "just" install my dotfiles, but VS Code runs it on any devcontainer it
# creates which means it's a convenient entrypoint to install other tools I may need as well as
# generally set up the container to my liking.

# Some devcontainers may run as root/superuser and not have sudo available
CONDITIONAL_SUDO=''
if (( $EUID != 0 )); then
    CONDITIONAL_SUDO='sudo'
fi

if grep Debian /etc/os-release > /dev/null; then
  echo "Bootstrapping dotfiles for Debian-based systems"

  # Allow for installing an updated git version from backports (pretty much all Debian containers
  # are Bullseye-based at the moment, so ship with Git 2.30 which is too old to support Git commit
  # signing with SSH keys)
  if grep -e bullseye /etc/os-release > /dev/null; then
    echo "deb http://deb.debian.org/debian bullseye-backports main" | $CONDITIONAL_SUDO tee /etc/apt/sources.list.d/bullseye-backports.list
    $CONDITIONAL_SUDO apt update
    $CONDITIONAL_SUDO apt install -y git/bullseye-backports
  fi

   $CONDITIONAL_SUDO apt install -y rcm fzf git-extras gnupg2 tree
elif grep -e Ubuntu /etc/os-release > /dev/null; then
  echo "Bootstrapping dotfiles for Ubuntu-based systems"

  $CONDITIONAL_SUDO apt install -y rcm fzf git-extras gnupg2 tree
else
  echo "Unsupported operating system"
  exit 1
fi

# Install dotfiles using RCM
rm $HOME/.rcrc || true
cat << EOF > $HOME/.rcrc
EXCLUDES="LICENSE README.md install.sh"
DOTFILES_DIRS="$HOME/dotfiles"
UNDOTTED="bin"
TAGS="devcontainer"
EOF
rcup -f

# Disable Git safe directory checking
#   This is a check introduced for a specific Git vulnerability on multi-user systems, ensuring that
#   any git repo directory is either allowlisted in `safe.directory` or owned by the current user,
#   that isn't relevant within a devcontainer running only a single project at a time (and causes
#   git commands to fail due to dubious ownership when mounted into the Colima VM)
git config --global --add safe.directory "*"
