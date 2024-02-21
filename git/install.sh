#!/bin/sh

echo "Start installing git..."

# git
sudo apt install -y git
git config --global user.email "lukasz.uszko@gmail.com"
git config --global user.name "luk6xff"

# gitk
sudo apt install -y gitk
