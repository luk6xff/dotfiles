#!/bin/sh

THIS_DIR=`dirname "$(readlink -f "$0")"`

# Clear all config if exists
rm -rf ~/.tmux
rm -f ~/.tmux.conf

# Install tmux
sudo apt install tmux

ln -sfT $THIS_DIR/.tmux.conf ~/.tmux.conf

# install tmux plugins
mkdir -p ~/.tmux/plugins && cd ~/.tmux/plugins && git clone https://github.com/tmux-plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins

echo "TMUX config done!"