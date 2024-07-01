DOTFILES_PATH="~/.config/ng-dotfiles"

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



# link config files
FILES=( #relative to home folder
  ".gitconfig"
)
# Check if the file exists
if [ ! -f "$FILE_PATH" ]; then
  echo ln -s ~/"$DOTFILES_PATH"/"$FILE_PATH" ~/"$FILE_PATH" 
else
  echo "File $FILE_PATH already exists!"
fi
