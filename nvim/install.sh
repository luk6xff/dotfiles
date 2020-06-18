#!/bin/sh

# Install neovim
sudo apt install python3-dev
sudo apt install cmake
sudo apt install neovim

THIS_DIR=`dirname "$(readlink -f "$0")"`
echo $THIS_DIR
ln -sf $THIS_DIR/ ~/.config/nvim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Optional, if you still use vim
ln -sf ~/.config/nvim/init.vim ~/.vimrc

echo 'Open neovim and run command :PlugInstall'
sleep 2
nvim

python3 ~/.config/nvim/plugged/YouCompleteMe/install.py --racer-completer --tern-completer

echo 'NVIM config done!'
