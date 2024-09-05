#!/usr/bin/env bash
set -e 

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

/home/linuxbrew/.linuxbrew/bin/brew install \
  argocd \
  fzf \
  git-delta \
  helm \
  jq \
  k9s \
  kubectx \
  kustomize \
  nvim \
  jandedobbeleer/oh-my-posh/oh-my-posh \
  pre-commit \
  terraform \
  tree-sitter \
  yq \
  zsh-completions 
