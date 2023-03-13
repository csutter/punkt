# punkt
📍 My cross-environment dotfiles and documentation

## Setup

### On macOS

> ⚠️ Work in progress: I'm not sure how well this will work out, and YMMV.

I am moving towards a strategy of having several accounts on macOS machines.

```bash
mkdir $HOME/Developer
git clone git@github.com:csutter/punkt.git $HOME/Developer/punkt
$HOME/Developer/punkt/install.sh
```

### On devcontainers

The repository provides a `install.sh` file which will automatically be picked up by VS Code when
starting a devcontainer or attaching to a regular Docker container.

## Brewfile

The macOS tag comes with a `Brewfile` to install Bash and tools for local use, which gets run by
the initial install script, and can be re-run if modified using:

```bash
brew bundle --file $HOME/Brewfile
```
