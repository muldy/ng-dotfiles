#!/usr/bin/env bash
set -e 

# PATHS
DOTFILES_PATH="$HOME/.config/ng-dotfiles"
OMZSH_DIR="$HOME/.config/oh-my-zsh"
DF_FONTS_FOLDER="$HOME/.local/share/fonts/"
DF_GIT_FOLDER="$HOME/got/"

#make sure folders exist
mkdir -p "$DOTFILES_PATH/backups/"
mkdir -p "$DF_FONTS_FOLDER"
mkdir -p "$HOME/git/"
mkdir -p "$DF_GIT_FOLDER"

echo -e "\nInstalling packages\n"
sudo apt install -y\
  neovim \
  git \
  tree \
  htop \
  tmux \
  zsh \
  curl \
  git-delta \
  pre-commit \
  build-essential


echo -e "\nInstalling Oh My ZShell\n"
# omzsh
if [ -d "$OMZSH_DIR" ]; then
  echo -e "\nOh My Zsh alredy installed"
else
  echo -e "\nInstalling Oh My Zsh"
  sh -c "$(cat ./oh-my-shell-install.sh)"
  mv $HOME/.oh-my-zsh $OMZSH_DIR

  echo "Now run ./dotfile_manage.sh"

fi
