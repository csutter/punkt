# punkt
📍 My cross-environment dotfiles and documentation

## Setup

### On macOS

See [macOS setup documentation](_docs/macos_setup.md).

### On devcontainers

The repository provides a `install.sh` file which will automatically be picked up by VS Code when
starting a devcontainer or attaching to a regular Docker container.

## Brewfile

The macOS tag comes with a `Brewfile` to install Bash and tools for local use, which gets run by
the initial install script, and can be re-run if modified using:

```bash
brew bundle --file $HOME/Brewfile
```
