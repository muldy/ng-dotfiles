#!/bin/bash
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


# omzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv ~/.oh-my-zsh ~/.config/oh-my-zsh


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

