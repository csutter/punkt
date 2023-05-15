# punkt
📍 My cross-environment dotfiles and documentation

## Setup

### On macOS

See [macOS setup documentation](_docs/macos_setup.md).

### On devcontainers

The `tag-devcontainer` tag provides an `install.sh` file which will should be configured in VS Code
as the devcontainer install script (alongside an install directory of `$HOME/dotfiles`). This will
set up `rcm` and other tooling, and set up the dotfiles.

## Brewfile

The macOS tag comes with a `Brewfile` to install Bash and tools for local use, which gets run by
the initial install script, and can be re-run if modified using:

```bash
brew bundle --file $HOME/Brewfile
```
