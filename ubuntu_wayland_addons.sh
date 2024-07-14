#!/usr/bin/env bash
set -e 

sudo apt install -y\
	gitk \
	tilix \
	gnome-shell-extension-manager \
  gpaste-2 \
	variety 

# set defaults
sudo update-alternatives --set x-terminal-emulator /usr/bin/tilix.wrapper
sudo snap install bitwarden
sudo snap connect bitwarden:password-manager-service

