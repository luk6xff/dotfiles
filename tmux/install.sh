#!/bin/sh

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

echo ">>> Start installing TMUX..."

# Clear all config if exists
rm -rf ~/.tmux
rm -f ~/.tmux.conf

# Install tmux
sudo apt install -y tmux

ln -sfT ${SCRIPT_DIR}/.tmux.conf ~/.tmux.conf

# For tmux-yank
sudo apt install -y xclip

# install tmux plugins
mkdir -p ~/.tmux/plugins && cd ~/.tmux/plugins && git clone https://github.com/tmux-plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins

