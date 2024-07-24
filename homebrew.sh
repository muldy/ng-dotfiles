#!/usr/bin/env bash
set -e 

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

/home/linuxbrew/.linuxbrew/bin/brew install \
  git-delta \
  helm \
  jq \
  k9s \
  kubectx \
  kustomize \
  pre-commit \
  terraform \
  yq \
  tree-sitter \
  zsh-completions
  zsh-completions \
  zsh-syntax-highlighting

