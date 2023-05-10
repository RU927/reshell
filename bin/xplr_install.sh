#!/bin/sh
git clone https://github.com/sayanarijit/xplr.git
cd xplr
cargo build --locked --release --bin xplr
sudo cp target/release/xplr /usr/local/bin/
mkdir -p ~/.config/xplr
version="$(xplr --version | awk '{print $2}')"
echo "version = '${version:?}'" > ~/.config/xplr/init.lua

