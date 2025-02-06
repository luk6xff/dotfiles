#/bin/sh

echo ">>> Start installing RUST..."

sudo apt install -y curl

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
