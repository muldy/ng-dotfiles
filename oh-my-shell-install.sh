#!/usr/bin/env bash
set -e 

curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh

./install.sh

mv "$HOME/.oh-my-zsh" "$HOME/.config/oh-my-zsh"

git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_CUSTOM:-~/.config/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
