#!/usr/bin/env bash
set -e 

echo -e "\nInstalling packages\n"
sudo apt install -y\
	syncthing 

systemctl --user enable syncthing.service
systemctl --user start syncthing.service
