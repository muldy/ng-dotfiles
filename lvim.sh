#!/bin/bash
set -u 
echo -e "\nInstalling packages\n"
sudo apt install -y \
	build-essential \
	flake8 \
	tree-sitter-cli \
	fd-find \
	ripgrep  

sudo systemctl daemon-reload


sudo apt install \
  flake8 \
  -y

LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)
