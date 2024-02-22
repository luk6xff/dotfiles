#!/bin/sh

echo "Start installing neovim..."

#sudo apt install -y neovim
#sudo snap install nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
#./nvim.appimage
sudo mkdir -p /opt/nvim
sudo mv nvim.appimage /opt/nvim/nvim
echo "export PATH=\$PATH:/opt/nvim/" >> ~/.bashrc
echo "export PATH=\$PATH:/opt/nvim/" >> ~/.zshrc
source ~/.bashrc

# Backup default configs
mv ~/.config/nvim ~/.config/nvim.bak

# Install LazyVim starter
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

echo 'NVIM config done, Open neovim and run :LazyHealth to see if everything works fine'
