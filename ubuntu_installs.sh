#!/bin/bash
set -u

# PATHS
DOTFILES_PATH="$HOME/.config/ng-dotfiles"
OMZSH_DIR="$HOME/.config/oh-my-zsh"
DF_FONTS_FOLDER="$HOME/.local/share/fonts/"
mkdir -p $DOTFILES_PATH/backups/
mkdir -p $DF_FONTS_FOLDER
mkdir -p $HOME/git/

echo -e "\nInstalling packages\n"
sudo apt install -y\
	neovim \
	git \
	tree \
	htop \
	tmux \
	tilix \
	zsh \
	curl \
	git-delta \
	gitk \
	gnome-shell-extension-manager \
	variety \
	build-essential

if [ -d "/sys/class/power_supply/BAT0" ]; then
  echo -e "\nBattery detected, installing tlp"
  sudo apt install tlp -y
else
  echo -e "\nNo Battery detected"
fi

# set defaults
sudo update-alternatives --set x-terminal-emulator /usr/bin/tilix.wrapper
sudo snap install bitwarden
sudo snap connect bitwarden:password-manager-service
dconf load /com/gexperts/Tilix/ < Tilix.dconf


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


# List of config files relative to the home directory
FILES=(
  "gitconfig"
  "zshrc"
  "bashrc"
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
