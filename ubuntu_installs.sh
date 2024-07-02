#!/bin/bash

# PATHS
DOTFILES_PATH="$HOME/.config/ng-dotfiles"
OMZSH_DIR="$HOME/.config/oh-my-zsh"
mkdir -p $DOTFILES_PATH/backups/
mkdir -p $HOME/.local/share/fonts/dotfilesfonts

echo -e "\nInstalling packages\n"
sudo apt install \
	neovim \
	git \
	tree \
	htop \
	tmux \
	tilix \
	zsh \
	curl \
	gnome-shell-extension-manager \
	-y

# set defaults
sudo update-alternatives --set x-terminal-emulator /usr/bin/tilix.wrapper


echo -e "\nInstalling Oh My ZShell\n"
# omzsh
if [ -d "$OMZSH_DIR" ]; then
  echo -e "\nOh My Zsh alredy installed"
else
  echo -e "\nInstalling Oh My Zsh"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  mv $HOME/.oh-my-zsh $OMZSH_DIR
  curl -L -o $HOME/.local/share/fonts/dotfilesfonts/fonts.tar.zx \
	  https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Ubuntu.tar.xz
  tar -xvJf \
	  $HOME/.local/share/fonts/dotfilesfonts/fonts.tar.zx \
	  -C $HOME/.local/share/fonts/dotfilesfonts/  
  rm $HOME/.local/share/fonts/dotfilesfonts/fonts.tar.zx \
fi


# List of config files relative to the home directory
FILES=(
  "gitconfig"
  "zshrc"
)

echo -e "\nHandle dotfiles\n"
for FILE in "${FILES[@]}"; do
  FILE_PATH="$HOME/.$FILE"
  DOTFILE_PATH="$DOTFILES_PATH/$FILE"

  # Check if the target file already exists
  if [ -f "$FILE_PATH" ]; then
	# Check if the file is a symbolic link
	if [ -L "$FILE_PATH" ]; then
	  echo "$FILE_PATH is a symbolic link."
	else
	  echo "$FILE_PATH is not a symbolic link, moving to $DOTFILES_PATH/backups/"
	  mv $FILE_PATH $DOTFILES_PATH/backups/
	  echo "Creating symbolic link for $FILE"
	  ln -s "$DOTFILE_PATH" "$FILE_PATH"
	fi
  else
    echo "Creating symbolic link for $FILE"
    ln -s "$DOTFILE_PATH" "$FILE_PATH"
  fi
done

