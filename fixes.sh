#!/usr/bin/env bash
set -e 

# tracker-3 disable:
#systemctl --user mask tracker-extract-3.service tracker-miner-fs-3.service tracker-miner-rss-3.service tracker-writeback-3.service tracker-xdg-portal-3.service tracker-miner-fs-control-3.service
#tracker3 reset -s -r

dconf reset -f /org/gnome/GPaste/

systemctl --user unmask tracker-miner-fs-3.service 
systemctl --user enable tracker-miner-fs-3.service
systemctl --user start tracker-miner-fs-3.service

#rm -rf .gnome .gnome2 .gconf .gconfd .metacity .cache .dbus .dmrc .mission-control .thumbnails ~/.config/dconf/user ~.compiz*


