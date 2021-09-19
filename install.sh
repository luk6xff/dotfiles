#!/bin/sh

# The script is going to work only on UBUNTU based distros
echo "Install and setup all the needed tools..."

## git
sudo apt install git
git config --global user.email "lukasz.uszko@gmail.com"
git config --global user.name "luk6xff"
## gitk
sudo apt install gitk
## vscode
sudo apt install code
## minicom
sudo apt install minicom
sudo usermod -a -G tty $USER
sudo usermod -a -G dialout $USER
## mc
sudo apt install mc
## vlc
sudo apt install vlc
## sshpass
sudo apt install sshpass
## flameshot
sudo snap install flameshot

## Generate sshkeys
ssh-keygen -t rsa -b 4096 -C "lukasz.uszko@gmail.com"
#cat ~/.ssh/id_rsa.pub > https://github.com/settings/keys

# We like the XDG_CONFIG standard, so make sure it is set up.
export XDG_CACHE_HOME=${XDG_CACHE_HOME:=${HOME}/.cache}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:=${HOME}/.config}
export XDG_DATA_HOME=${XDG_DATA_HOME:=${HOME}/.local/share}

# Find the location of this file and the dotfile repo directory.
DOTFILES=`dirname "$(readlink -f "$0")"`

# Simply invoke the install script from each section of this repo.
dirs=$(find $DOTFILES -maxdepth 1 -mindepth 1 -type d -not -name '.git' -print)
for dir in $dirs
do
  echo "Installing ${dir}..."
  $dir/install.sh
done
