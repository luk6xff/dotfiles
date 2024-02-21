#!/bin/sh

echo "Download, install and configure all the other tools..."

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
sudo apt install -y vlc

# sshpass
sudo apt install -y sshpass

# flameshot
sudo snap install -y flameshot

# htop
sudo apt-get install -y htop

# wireshark
sudo apt install -y wireshark


echo "All the tools installed correctly!"
