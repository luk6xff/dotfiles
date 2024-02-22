#!/bin/sh

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

echo "Start installing zsh..."

sudo apt install -y curl
sudo apt install -y zsh
zsh --version
echo $SHELL

echo "Installing Oh My Zsh!"

# Backup .zshrc
#rm -rf ~/.oh-my-zsh
mv ~/.zshrc ~/.zshrc.bak
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Themes
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# Plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Set .zshrc
ln -sfT ${SCRIPT_DIR}/.zshrc ~/.zshrc

# Set shell to zsh
#chsh -s $(which zsh)
#source ~/zshrc

echo "ZSH installed succesfully!"
