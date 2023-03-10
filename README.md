# punkt
📍 My cross-environment dotfiles and documentation

## Setup

```bash
mkdir $HOME/Developer
git clone git@github.com:csutter/punkt.git $HOME/Developer/punkt
$HOME/Developer/punkt/install.sh
```

## Brewfile

The macOS tag comes with a `Brewfile` to install Bash and tools for local use, which gets run by
the initial install script, and can be re-run if modified using:

```bash
brew bundle --file $HOME/Brewfile
```
