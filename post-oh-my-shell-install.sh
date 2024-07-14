#!/usr/bin/env bash
set -e 

rm -rf /tmp/install.sh

mv "$HOME/.oh-my-zsh" "$HOME/.config/oh-my-zsh" || echo moved

./dotfile_manage.sh 

git clone https://github.com/zsh-users/zsh-autosuggestions "$HOME/.config/oh-my-zsh/custom/plugins/zsh-autosuggestions"
