#!/bin/sh

curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod u+x nvim.appimage

THIS_DIR=`dirname "$(readlink -f "$0")"`

ln -sf $THIS_DIR/* ~/.config/nvim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Optional, if you still use vim
ln -sf ~/.config/nvim/init.vim ~/.vimrc

echo 'Open neovim and run command :PlugInstall'
nvim

# python3 ~/.config/nvim/plugged/YouCompleteMe/install.py --all
python3 ~/.config/nvim/plugged/YouCompleteMe/install.py --racer-completer --tern-completer 

echo 'NVIM config done!'
