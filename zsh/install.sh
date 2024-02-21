#!/bin/sh

echo "Start installing zsh..."

sudo apt install -y zsh
sudo apt install -y curl
zsh --version
echo $SHELL

echo "ZSH installed succesfully"
