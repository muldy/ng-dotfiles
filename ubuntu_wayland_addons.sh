#!/usr/bin/env bash
set -e 

sudo apt install -y\
	gitk \
	tilix \
	gnome-shell-extension-manager \
	variety 

# set defaults
sudo update-alternatives --set x-terminal-emulator /usr/bin/tilix.wrapper
sudo snap install bitwarden
sudo snap connect bitwarden:password-manager-service

