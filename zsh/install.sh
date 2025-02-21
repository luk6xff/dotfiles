#!/bin/sh

# Prompt the user to confirm installation
echo ">>> Do you want to install ZSH on this machine? (y/N)"
read install_choice
case "$install_choice" in
  [Yy]* )
    echo ">>> Proceeding with installation..."
    ;;
  * )
    echo ">>> Installation cancelled."
    exit 0
    ;;
esac

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

echo ">>> Start installing ZSH..."

sudo apt install -y curl
sudo apt install -y zsh
zsh --version
echo $SHELL

echo ">>> Installing Oh My Zsh!"

# Backup .zshrc if it exists
rm -rf ~/.oh-my-zsh
[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc.bak

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Link the custom .zshrc from SCRIPT_DIR
ln -sfT ${SCRIPT_DIR}/.zshrc ~/.zshrc

echo ">>> ZSH installed successfully!"
