#!/bin/sh

echo ">>> Start installing NEOVIM + LAZYGIT..."

# Install some utils
sudo apt install -y curl

# Install neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage

#./nvim.appimage
sudo mkdir -p /opt/nvim
sudo mv nvim-linux-x86_64.appimage /opt/nvim/nvim
echo "export PATH=\$PATH:/opt/nvim/" >> ~/.bashrc
echo "export PATH=\$PATH:/opt/nvim/" >> ~/.zshrc

# Backup default configs
mv ~/.config/nvim ~/.config/nvim.bak

# Install LazyVim and other dependencies
# fd-find
sudo apt install -y fd-find
# lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
# ripgrep
sudo apt install -y ripgrep
# nerd-fonts
git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git
cd nerd-fonts/
./install.sh JetBrainsMono
# alacritty
#cargo install alacritty
# LazyVim starter
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

echo '>>> NVIM config done, Run: `nvim` and open `:LazyHealth` to see if everything works fine'
