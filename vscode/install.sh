#!/bin/sh

# vscode
sudo apt install -y code
#sudo snap install code --classic

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

ln -sfT ${SCRIPT_DIR}/settings.json ~/.config/Code/User/settings.json
