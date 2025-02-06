#!/bin/sh

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

echo ">>> Start installing VSCODE..."

# vscode
sudo apt-get install -y wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install -y apt-transport-https
sudo apt update
sudo apt install -y code
# or
#sudo snap install code --classic

# settings
ln -sfT ${SCRIPT_DIR}/settings.json /home/${USER}/.config/Code/User/settings.json

# extensions
code --install-extension ms-python.python
code --install-extension ms-vscode.cpptools
code --install-extension ms-vscode.cmake-tools
code --install-extension ms-vscode-remote.remote-ssh
#code --install-extension ms-vscode-remote.vscode-remote-extensionpack
code --install-extension eamodio.gitlens
code --install-extension github.copilot
code --install-extension rust-lang.rust-analyzer
