#!/bin/sh

echo ">>> Start download, instalation and configure all the other needed TOOLS..."

sudo apt update

# gcc build essentials
sudo apt install -y build-essential

# clang
sudo apt install -y clang

# cmake
sudo apt install -y cmake

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

# sshpass
sudo apt install -y sshpass

# flameshot
sudo snap install -y flameshot

# htop
sudo apt-get install -y htop

# wireshark
sudo apt install -y wireshark

# meld
sudo apt install -y meld


echo ">>> All the tools installed correctly!"
