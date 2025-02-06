#!/bin/sh

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

echo "Start installing GIT..."

# git
sudo apt install -y git
cp ${SCRIPT_DIR}/.gitconfig /home/${USER}/

# gitk
sudo apt install -y gitk
