#!/bin/bash
sudo apt install \
	neovim \
	git \
	tree \
	htop \
	tmux \
	tilix \
	-y



# set defaults
sudo update-alternatives --set x-terminal-emulator /usr/bin/tilix.wrapper


DOTFILES_PATH="$HOME/.config/ng-dotfiles"
mkdir -p $DOTFILES_PATH/backup/
# List of config files relative to the home directory
FILES=(
  "gitconfig"
  "zshrc"
)

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

