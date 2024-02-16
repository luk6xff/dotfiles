#!/bin/sh

# The script is going to work only on UBUNTU based distros
echo "Start setting up my machine..."

## Generate sshkeys
ssh-keygen -t rsa -b 4096 -C "lukasz.uszko@gmail.com"
#cat ~/.ssh/id_rsa.pub > https://github.com/settings/keys
# Update permissions
cd ~ && chmod 600 ~/.ssh/* && chmod 700 ~/.ssh && chmod 644 ~/.ssh/*.pub


# Find the location of this file and the dotfile repo directory.
DOTFILES=`dirname "$(readlink -f "$0")"`

# Simply invoke the install script from each section of this repo.
dirs=$(find $DOTFILES -maxdepth 1 -mindepth 1 -type d -not -name '.git' -print)
for dir in $dirs
do
  echo "Start installing ${dir}..."
  $dir/install.sh
done

echo "The machine is ready to use!"
