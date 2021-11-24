# punkt
📍 My cross-environment dotfiles and documentation

## Setup

Prerequisites:
- `rcm` installed via package manager of choice
- SSH key set up

```bash
mkdir $HOME/repos
git clone git@github.com:csutter/punkt.git $HOME/repos/punkt
$HOME/repos/punkt/install.sh
```

## Brewfile

The macOS tag comes with a `Brewfile` to install Bash and tools for local use, which gets run by
the initial install script, and can be re-run if modified using:

```bash
brew bundle --file $HOME/Brewfile
```
