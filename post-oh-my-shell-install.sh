#!/usr/bin/env bash
set -e 

rm -rf /tmp/install.sh

mv "$HOME/.oh-my-zsh" "$HOME/.config/oh-my-zsh" || echo moved

./dotfile_manage.sh 

git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSOM/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
