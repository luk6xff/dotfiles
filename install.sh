#!/bin/sh
# ------------------------------------------------------------------
# Author: luk6xff
# Date: 2020.07.11
#
# Script for setting up the machine on Debian-based distributions.
# ------------------------------------------------------------------

# Determine the directory of this script.
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
echo ">>>>>> Script directory: $SCRIPT_DIR"

echo ">>>>>> This script is intended for Debian-based distros. Starting machine setup..."

# Prompt user to generate SSH keys.
read -p ">>>>>> Do you want to generate SSH keys for this machine? (y/N): " generate_keys

if [ "$generate_keys" = "y" ] || [ "$generate_keys" = "Y" ]; then
  mkdir -p ~/.ssh
  # Prompt for the email address to use in the SSH key comment.
  read -p ">>>>>> Enter your email address for ssh-keygen: " email
  ssh-keygen -t ed25519 -C "$email"

  # Update permissions for the SSH directory and its files.
  chmod 700 ~/.ssh
  chmod 600 ~/.ssh/*
  chmod 644 ~/.ssh/*.pub
else
  echo ">>>>>> Skipping SSH key generation."
fi

## Send public key to the VPS server
read -p ">>>>>> Do you want to send the public key to the server? (y/N): " send_key
if [ "$send_key" = "y" ] || [ "$send_key" = "Y" ]; then
  # Prompt for the server address and username.
  server_address='195.181.218.234'
  server_username='root'

  # Send the key onto the server.
  ssh-copy-id -i ~/.ssh/id_ed25519.pub "$server_username@$server_address"
else
  echo ">>>>>> Skipping public key transfer."
fi

# Create directory tree.
mkdir -p ~/Projects ~/Tools

# Find subdirectories (excluding .git) and run their install.sh scripts.
dirs=$(find "$SCRIPT_DIR" -maxdepth 1 -mindepth 1 -type d -not -name '.git')
echo ">>>>>> Available directories to install:"
echo "$dirs"

for dir in $dirs; do
  if [ -x "${dir}/install.sh" ]; then
    echo ">>>>>> Running install script in ${dir}..."
    "${dir}/install.sh"
  else
    echo ">>>>>> No executable install.sh found in ${dir}, skipping."
  fi
done


# Set shell to zsh
echo ">>>>>> Switching shell to zsh (You must log out from your user session and log back in to see this change)..."
chsh -s $(which zsh)

echo ">>>>>> The machine is ready to use!"

