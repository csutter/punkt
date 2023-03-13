# macOS Setup 🍎

Setup notes for getting a new macOS machine set up from scratch.

## User accounts

Create a primary user account with iCloud login as usual during setup, then once installed:

- Set up an `Administrator` account and demote the primary user created during installation to a
  regular user for personal use
- Set up further standard user accounts for clients/projects

## Set up Homebrew

Homebrew needs to be installed as the administrator user. Follow the instructions on the
[Homebrew website](https://brew.sh).

As the admin user, clone the dotfiles to a convenient location (e.g. `~/Developer/punkt`), then
install Homebrew dependencies using the provided Brewfile. The cloning should be done using the
HTTPS (not `git://`) repo URL as the admin user won't be logged in to 1Password.

```bash
brew bundle --file ~/Developer/punkt/Brewfile
```

Note: This needs to be done _before_ setting up the dotfiles for the admin user (as otherwise the
dotfiles dependencies won't be installed).

## For each local user that will need the dotfiles installed:
### Set up 1Password

This is required for SSH keys for Git. Sign in to 1Password and enable SSH agent.

### Set up a `Developer` directory in the home directory

This sounds a bit weird as a directory name, but gets a fancy icon from macOS.

### Clone the dotfiles repository into it and set up

```bash
git clone git@github.com:csutter/punkt.git $HOME/Developer/punkt
$HOME/Developer/punkt/install.sh
```

## Initial macOS setup

> One day this might be automated - for now, I don't do it often enough to be worth automating.

- Remove superfluous icons from Dock

### System Preferences

> ⚠️ TODO: Adapt to new Ventura "System Settings" app

- General
  - Set appearance to auto, choose colours as desired
- Desktop & Screen Saver
  - Pick a nice wallpaper
- Dock & Menu Bar
  - Reduce dock size
  - Untick "Show recent applications in Dock"
  - Configure menu bar (show battery percentage, hide WiFi)
- Mission Control
  - Untick "Automatically rearrange Spaces"
- Siri
  - Disable completely
- Spotlight
  - Disable superfluous options
- Touch ID
  - Set up
- Keyboard
  - Keyboard: Set touchbar to show F-keys (on legacy MacBook Pros),
    tick "Use F keys as standard function keys on external keyboards"
  - Text: Remove default text replacements
  - Input Sources: Set to US and disable UK
  - Add a shortcut to disable `Cmd-Q` for Safari:
    - In Shortcuts > App Shortcuts, add `Cmd-Ctrl-Q` as a shortcut for "Quit Safari"
- Trackpad
  - Disable "look up & data detectors"
  - Enable "tap to click"
  - Dial up tracking speed
  - Disable "natural scrolling"
  - Set "swipe between pages" to "swipe with three fingers"
  - Set "Mission Control" to "swipe up with four fingers"
- Display
  - Set up Night Shift
- Battery
  - Configure "turn off display after" for Battery and Power Adapter
  - On Power Adapter, enable "Prevent computer from sleeping automatically"
