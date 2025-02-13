# NOTE 2025-01-30: I'm not using `brew bundle` at the moment, but this file is still useful for
# reference until I properly redefine my local software workflow.
brew "rcm"

# Shell & tools
brew "bash"
brew "bash-completion"
brew "direnv"
brew "fd"
brew "fzf"
brew "git"
brew "neovim"
brew "rcm"
brew "ripgrep"
brew "ruby-build"
brew "tree"
brew "wezterm"
brew "xh"

# GDS tooling
# c.f. https://docs.publishing.service.gov.uk/manual/get-started.html#4-install-gds-command-line-tools
tap "alphagov/gds"
brew "gds-cli"
brew "govuk-connect"
brew "kubernetes-cli"
brew "kubectx"
cask "aws-vault"

# govuk-docker prerequisites
#  (these would normally be installed by govuk-docker's `bin/setup`, but I don't want to run that
#  as it sets up dnsmasq and requires root access, instead I add `dev.gov.uk` to my DNS server)
brew "pv"
brew "shellcheck"
