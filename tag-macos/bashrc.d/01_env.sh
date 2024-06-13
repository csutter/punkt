export PROMPT_PREFIX='\u@\h:'
export HOMEBREW_NO_ANALYTICS=1
export CLICOLOR=1
export EDITOR="code --wait"
export SYSTEM_TYPE="macos-workstation"
export COMPOSE_MENU=0 # disable Docker Desktop's irritating hijack of `docker-compose`

# Some tools don't properly pick up on 1Password SSH agent from `~/.ssh/config` (looking at you,
# VS Code devcontainers), set it using env variable to get them working
# cf. https://1password.community/discussion/132867/visual-studio-code-remote-development-server-and-1password-ssh-config
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

# Docker Desktop user folder
pathmunge "$HOME/.docker/bin"
