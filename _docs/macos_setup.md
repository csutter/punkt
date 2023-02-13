# macOS Setup 🍎

Setup notes for getting a new macOS machine set up from scratch.

> One day this might be automated - for now, I don't do it often enough to be worth automating.

## Initial setup

- Remove superfluous icons from Dock

### System Preferences

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

## Set up CLI

- Install [Homebrew](https://brew.sh)
- Create `Developer` folder in home directory
- Set up my [dotfiles](https://github.com/csutter/punkt)
  - Run `brew bundle` to install dependencies, including Bash (macOS uses `zsh` by default and
    only includes an ancient version of Bash)
- Set default shell to Homebrew's Bash:
  - Add `/usr/local/bin/bash` or `/opt/local/bin/bash` depending on x86/ARM64 (see `brew --prefix`)
  - Change shell using `chsh -s $(brew --prefix)/bin/bash`
- iTerm2: Enable _Natural Text Editing_ profile (Preferences->Profiles->Keys->Load Preset...)

## GPG signing

[Set up a GPG key](https://samuelsson.dev/sign-git-commits-on-github-with-gpg-in-macos/) and add
it to Github.

**Known issue**: `gpg-agent.conf` doesn't let me use environment variables to define the location
of its `pinentry` program so it's hardcoded to the x86 Homebrew prefix. Investigate and fix later.
