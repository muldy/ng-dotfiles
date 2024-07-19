#!/usr/bin/env bash
set -e 

rm -rf "$HOME/.oh-my-zsh" "$HOME/.config/oh-my-zsh"

curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -o /tmp/install.sh

echo "sh /tmp/install.sh"

