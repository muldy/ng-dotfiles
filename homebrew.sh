#!/usr/bin/env bash
set -e 

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

/home/linuxbrew/.linuxbrew/bin/brew install \
  argocd \ 
  git-delta \
  helm \
  jq \
  k9s \
  kubectx \
  kustomize \
  pre-commit \
  terraform \
  tree-sitter \ 
  yq \
  zsh-completions 
