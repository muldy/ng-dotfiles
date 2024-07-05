#!/usr/bin/env bash
set -e 

# PATHS
DOTFILES_PATH="$HOME/.config/ng-dotfiles"
OMZSH_DIR="$HOME/.config/oh-my-zsh"
DF_FONTS_FOLDER="$HOME/.local/share/fonts/"
DF_GIT_FOLDER="$HOME/got/"

#make sure folders exist
mkdir -p $DOTFILES_PATH/backups/
mkdir -p $DF_FONTS_FOLDER
mkdir -p $HOME/git/
mkdir -p $DF_GIT_FOLDER

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
	build-essential


echo -e "\nInstalling Oh My ZShell\n"
# omzsh
if [ -d "$OMZSH_DIR" ]; then
  echo -e "\nOh My Zsh alredy installed"
else
  echo -e "\nInstalling Oh My Zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  mv $HOME/.oh-my-zsh $OMZSH_DIR
  curl -L -o $DF_FONTS_FOLDER/fonts.tar.zx \
	  https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Ubuntu.tar.xz
  tar -xvJf \
	  $DF_FONTS_FOLDER/fonts.tar.zx \
	  -C $DF_FONTS_FOLDER
  rm -rf $DF_FONTS_FOLDER/fonts.tar.zx
  fc-cache -f -v
fi

