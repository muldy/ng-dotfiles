#!/usr/bin/env bash
set -e 

DF_FONTS_FOLDER="$HOME/.local/share/fonts/"

FONTS=(
  "https://download-cdn.jetbrains.com/fonts/JetBrainsMono-2.304.zip"
  "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/NerdFontsSymbolsOnly.zip"
  "https://codeload.github.com/googlefonts/noto-emoji/zip/refs/tags/v2.042"
  "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip"
  )

echo -e "Adding fonts"
for FONT in "${FONTS[@]}"; do
  curl -L -o "$DF_FONTS_FOLDER/fonts_file" \
    $FONT
  unzip \
    "$DF_FONTS_FOLDER/fonts_file" \
    -d "$DF_FONTS_FOLDER"
  rm -rf "$DF_FONTS_FOLDER/fonts_file"
done
fc-cache -r
fc-cache -f -v
