#!/bin/sh

echo "Start installing zsh..."

sudo apt install -y zsh
sudo apt install -y curl
zsh --version
echo $SHELL

echo "Installing Oh My Zsh!
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "ZSH installed succesfully"
