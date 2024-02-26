#!/bin/sh

# Find the location of this file and the dotfile repo directory.
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
echo "Script directory: $SCRIPT_DIR"

# Hello message
echo "The script is going to work only on Debian based distros, Start setting up my machine..."

# Generate sshkeys and update permissions
#ssh-keygen -t rsa -b 4096 -C "lukasz.uszko@gmail.com"
cd ~ && chmod 600 ~/.ssh/* && chmod 700 ~/.ssh && chmod 644 ~/.ssh/*.pub

# Create a directory tree
mkdir -p ~/Projects
mkdir -p ~/Tools

# Simply invoke the install script from each section of this repo.
dirs=$(find ${SCRIPT_DIR} -maxdepth 1 -mindepth 1 -type d -not -name '.git' -print)
echo "All available dirs to be installed: ${dirs}"
for dir in $dirs
do
  echo "Start installing ${dir}..."
  ${dir}/install.sh
done

echo "The machine is ready to use!"
