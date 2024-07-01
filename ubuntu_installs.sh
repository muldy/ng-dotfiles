#!/bin/bash
sudo apt install \
	neovim \
	git \
	tree \
	htop \
	tmux \
	tilix \
	-y


sudo update-alternatives --set x-terminal-emulator /usr/bin/tilix.wrapper
