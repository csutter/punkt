# punkt
📍 My cross-environment dotfiles and documentation

## Setup

### On macOS

See [macOS setup documentation](_docs/macos_setup.md).

⚠️ For workstation use, this repository is complemented by an additional private repository
containing restricted configuration and non-free assets (such as purchased fonts). Some
configuration in this repository may not work properly without `rcm` set up with both the public and
the private repository in `DOTFILES_DIRS`.

### On devcontainers

The `tag-devcontainer` tag provides an `install.sh` file which will should be configured in VS Code
as the devcontainer install script (alongside an install directory of `$HOME/dotfiles`). This will
set up `rcm` and other tooling, and set up the dotfiles.
