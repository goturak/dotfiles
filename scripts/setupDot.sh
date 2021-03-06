#!/bin/bash

# Install stuff
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install vim zsh tmux zathura tldr wget curl httpie xcape exuberant-ctags

# Syncthing
# curl -s https://syncthing.net/release-key.txt | sudo apt-key add -
# sudo echo "deb https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
# sudo apt-get update
# sudo apt-get install syncthing

# Move dotfiles to appropriate locations
printf "so %s/Dev/dotfiles/vim/vimrc" "$HOME" > ~/.vimrc
printf "source-file %s/Dev/dotfiles/tmux/tmux.conf" "$HOME" > ~/.tmux.conf
printf "source %s/Dev/dotfiles/zsh/bashrc" "$HOME" > ~/.bashrc
ln -s "$HOME/Dev/dotfiles/tldrrc" "$HOME/.tldrrc"
ln -s "$HOME/Dev/dotfiles/zathurarc" "$HOME/.config/zathura/zathurarc"
# ln -s "$HOME/Dev/dotfiles/syncthing/config.xml" "$HOME/.config/syncthing/config.xml"

# Create vim folders
mkdir -p "$HOME"/.vim/{backup,swap,undo}

# Install TPM and oh-my-zsh
git clone "https://github.com/tmux-plugins/tpm" "$HOME/.tmux/plugins/tpm"
sh -c "$(curl -fksSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Once OMZ is installed, setup zsh
printf "source '%s/Dev/dotfiles/zsh/zshrc'" "$HOME" > ~/.zshrc

# Install zsh plugins
# Autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
# Syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"

# Install tmux plugins
"$HOME/.tmux/plugins/tpm/bin/install_plugins"
