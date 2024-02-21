#!/bin/sh

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

# vscode
sudo apt install -y code
# or 
#sudo snap install code --classic

ln -sfT ${SCRIPT_DIR}/settings.json ~/.config/Code/User/settings.json
