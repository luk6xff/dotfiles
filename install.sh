#!/bin/sh

# The script is going to work only on UBUNTU based distros

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