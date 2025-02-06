#!/bin/sh

echo "Download, install and configure all the other tools..."

sudo apt update

# gcc build essentials
sudo apt install -y build-essential

# clang
sudo apt install -y clang

# cmake
sudo apt install -y cmake

# flatpak
sudo apt install -y flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# docker
sudo apt install -y docker.io
sudo groupadd docker
sudo usermod -aG docker ${USER}
sudo chmod 666 /var/run/docker.sock

# minicom
sudo apt install -y minicom
sudo usermod -a -G tty $USER
sudo usermod -a -G dialout $USER

# mc
sudo apt install -y mc

# vlc
#sudo apt install -y vlc

# imhex
wget https://github.com/WerWolv/ImHex/releases/download/v1.36.2/imhex-1.36.2-x86_64.AppImage -P ~/Tools/
chmod +x ~/Tools/imhex-*.AppImage

# sshpass
sudo apt install -y sshpass

# flameshot
sudo snap install -y flameshot

# htop
sudo apt-get install -y htop

# wireshark
sudo apt install -y wireshark

# gef
git clone https://github.com/hugsy/gef.git ~/Tools/gef
echo source ~/Tools/gef/gef.py >> ~/.gdbinit


echo ">>> All the tools installed correctly!"
