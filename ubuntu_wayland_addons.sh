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

echo -e "Adding fonts"
curl -L -o "$DF_FONTS_FOLDER/fonts.tar.zx" \
	https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Ubuntu.tar.xz
tar -xvJf \
	"$DF_FONTS_FOLDER/fonts.tar.zx" \
	-C "$DF_FONTS_FOLDER"
rm -rf "$DF_FONTS_FOLDER/fonts.tar.zx"
fc-cache -f -v
