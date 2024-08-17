#!/usr/bin/env bash
set -e 

# PATHS
DOTFILES_PATH="$HOME/.config/ng-dotfiles"
OMZSH_DIR="$HOME/.config/oh-my-zsh"
DF_FONTS_FOLDER="$HOME/.local/share/fonts/"
DF_GIT_FOLDER="$HOME/got/"
TMUX_PATH="$HOME/.config/tmux/"

#make sure folders exist
mkdir -p "$DOTFILES_PATH/backups/"
mkdir -p "$DF_FONTS_FOLDER"
mkdir -p "$HOME/git/"
mkdir -p "$DF_GIT_FOLDER"
mkdir -p "$TMUX_PATH"

echo -e "\nInstalling packages\n"
sudo apt install -y\
  neovim \
  git \
  tree \
  htop \
  tmux \
  zsh \
  curl \
  xsel \
  net-tools \
  build-essential

TMUX_TPM="$TMUX_PATH/plugins/tpm"
# Check if the folder does not exist
if [ ! -d "$TMUX_TPM" ]; then
    git clone https://github.com/tmux-plugins/tpm "$TMUX_TPM"
fi
