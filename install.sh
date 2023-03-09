#!/bin/bash
set -euxo pipefail

DOTFILES_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo "Dotfiles are in '$DOTFILES_DIR'"

if uname -a | grep Darwin > /dev/null; then
  . install/macos.sh
else
  . install/devcontainer.sh
fi
