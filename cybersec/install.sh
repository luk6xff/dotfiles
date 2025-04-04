#!/bin/sh

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

echo ">>> Start installing CYBERSEC stuff..."
# List is based on my toolset: https://github.com/luk6xff/ctf/blob/master/README.md


### PYTHON PACKAGES ###
cd ~/Projects
sudo apt-get update
sudo apt-get install python3 python3-pip python3-dev git libssl-dev libffi-dev build-essential
python3 -m venv venv
source venv/bin/activate

# Pwntools
python -m pip install --upgrade pip
python -m pip install --upgrade pwntools



### PACKAGES ###
# GDB
sudo apt install -y gdb
sudo apt install -y gdbserver
sudo apt install -y gdb-multiarch



### TOOLS ###
cd ~/Tools

# GEF
git clone https://github.com/hugsy/gef.git ~/Tools/gef
echo source ~/Tools/gef/gef.py >> ~/.gdbinit

# Pwndbg
git clone https://github.com/pwndbg/pwndbg ~/Tools/pwndbg
cd ~/Tools/pwndbg && ./setup.sh

# Imhex
cd ~/Tools && wget https://github.com/WerWolv/ImHex/releases/download/v1.36.2/imhex-1.36.2-x86_64.AppImage -P ~/Tools/
chmod +x ~/Tools/imhex-*.AppImage

# Ghidra
sudo apt install openjdk-21-jdk -y
wget https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_11.3.1_build/ghidra_11.3.1_PUBLIC_20250219.zip -P ~/Tools
unzip ghidra_11.3.1_PUBLIC_20250219.zip

# Cutter
wget https://github.com/rizinorg/cutter/releases/download/v2.3.4/Cutter-v2.3.4-Linux-x86_64.AppImage -P ~/Tools
chmod +x ~/Tools/Cutter*

# Burpsuite
wget -O burpsuite.jar 'https://portswigger.net/DownloadUpdate.ashx?Product=Free'
chmod 755 burpsuite.jar

# ZapProxy
docker pull ghcr.io/zaproxy/zaproxy:stable
## To run: https://www.zaproxy.org/docs/docker/about/

# MitmProxy

# QEMU

# Osquery


