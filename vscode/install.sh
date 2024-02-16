#!/bin/sh

# vscode
sudo apt install -y code
#sudo snap install code --classic

THIS_DIR=`dirname "$(readlink -f "$0")"`

ln -sfT $THIS_DIR/settings.json ~/.config/Code/User/settings.json
