#!/bin/sh

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Clear all config if exists
rm -rf ~/.tmux
rm -f ~/.tmux.conf

# Install tmux
sudo apt install tmux

ln -sfT ${SCRIPT_DIR}/.tmux.conf ~/.tmux.conf

# install tmux plugins
mkdir -p ~/.tmux/plugins && cd ~/.tmux/plugins && git clone https://github.com/tmux-plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins

