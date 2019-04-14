#!/bin/sh

THIS_DIR=`dirname "$(readlink -f "$0")"`

ln -sfT $THIS_DIR/.tmux.conf ~/.tmux.conf

# install tmux plugins 
mkdir -p ~/.tmux/plugins && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && ~/.tmux/plugins/tpm/bin/install_plugins

echo "TMUX config done!"