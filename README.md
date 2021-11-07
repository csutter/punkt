# punkt
📍 My cross-environment dotfiles and documentation

## Setup

Prerequisites:
- `rcm` installed via package manager of choice
- SSH key set up

```bash
mkdir $HOME/repos
git clone git@github.com:csutter/punkt.git $HOME/repos/punkt

# For macOS use
ln -s $HOME/repos/punkt/rcrc/rcrc.macos $HOME/.rcrc

rcup
```

## Brewfile

The macOS tag comes with a `Brewfile` to install Bash and tools for local use:

```bash
brew bundle --file $HOME/Brewfile
```
