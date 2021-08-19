#!/bin/sh

# Install neovim
sudo apt install curl
sudo apt install neovim

THIS_DIR=`dirname "$(readlink -f "$0")"`
echo $THIS_DIR
ln -sf $THIS_DIR/ ~/.config/nvim

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Optional, if you still use vim
ln -sf ~/.config/nvim/init.vim ~/.vimrc

echo 'Open neovim and run command :PlugInstall'
sleep 2
nvim

python3 ~/.config/nvim/plugged/YouCompleteMe/install.py --racer-completer --tern-completer

echo 'NVIM config done!'
