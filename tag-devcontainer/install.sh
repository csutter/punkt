# Get these dotfiles bootstrapped on a devcontainer
# TODO: Generalise to allow them to run on RHEL-based containers too

# Install rcm
sudo apt install -y rcm

# Set up the rcrc and install dotfiles
rm $HOME/.rcrc
ln -s $HOME/dotfiles/rcrc/rcrc.devcontainer $HOME/.rcrc
rcup -f

# Install any additional software that I need in devcontainers
sudo apt install -y fzf git-extras gnupg2 tree
