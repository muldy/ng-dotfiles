#!/usr/bin/env bash
set -e 

# PATHS
DOTFILES_PATH="$HOME/.config/ng-dotfiles"

FILES=(
  ".gitconfig"
  ".zshrc"
  ".bashrc"
  ".config/tmux/tmux.conf"
  ".config/kitty/kitty.conf"
  ".config/nvim"
)

echo -e "\nHandle dotfiles\n"
for FILE in "${FILES[@]}"; do
  FILE_PATH="$HOME/$FILE"
  file_name=$(basename "$FILE_PATH")
  DOTFILE_PATH="$DOTFILES_PATH/$file_name"


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
    if [ -L "$FILE_PATH" ]; then
      echo "$FILE_PATH is a symbolic link."
    else
      echo "Creating symbolic link for $FILE"
      ln -s "$DOTFILE_PATH" "$FILE_PATH"
    fi
  fi
done
