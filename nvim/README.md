# Neovim config

Simple Neovim config by luk6xff

## Install

### manually 
1. $ curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
   $ chmod u+x nvim.appimage
   $ ./nvim.appimage
2. $ cp -r nvim ~/.config/
3. $ curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
4. Open neovim and run: :PlugInstall
5. $ ln -s ~/.config/nvim/init.vim ~/.vimrc # Optional, if you still use vim
6. Activate YouCompleteMe plugin by running:
   $ ~/.config/nvim/plugged/YouCompleteMe/install.py --racer-completer --tern-completer
7. Done!

### via install script
1. $ ./install.sh
2. Done!

## License
MIT Lukasz Uszko 2019
