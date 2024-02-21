#!/bin/sh

echo "Start installing neovim..."

sudo snap install nvim

# Backup default configs
mv ~/.config/nvim{,.bak}

# Install LazyVim starter
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

echo 'NVIM config done, Open neovim and run :LazyHealth to see if everything works fine'
