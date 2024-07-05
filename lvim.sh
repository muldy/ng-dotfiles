#!/bin/bash
set -u 
echo -e "\nInstalling packages\n"
sudo apt install \
	build-essential \
	flake8 \
	tree-sitter-cli \
	fd-find \
	ripgrep \ 
	-y

sudo systemctl daemon-reload


LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)
