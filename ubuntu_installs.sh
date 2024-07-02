#!/bin/bash

# PATHS
DOTFILES_PATH="$HOME/.config/ng-dotfiles"
OMZSH_DIR="$HOME/.config/oh-my-zsh"

echo -e "\nInstalling packages\n"
sudo apt install \
	neovim \
	git \
	tree \
	htop \
	tmux \
	tilix \
	zsh \
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
fi


mkdir -p $DOTFILES_PATH/backup/
# List of config files relative to the home directory
FILES=(
  "gitconfig"
  "zshrc"
)

echo -e "\nHandle dotfiles"
for FILE in "${FILES[@]}"; do
  FILE_PATH="$HOME/.$FILE"
  DOTFILE_PATH="$DOTFILES_PATH/$FILE"

  # Check if the target file already exists
  if [ ! -f "$FILE_PATH" ]; then
    echo "Creating symbolic link for $FILE"
    ln -s "$DOTFILE_PATH" "$FILE_PATH"
  else
    echo "File $FILE already exists!"

  fi
done

