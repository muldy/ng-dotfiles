#!/usr/bin/env bash
set -e 

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

brew install \
  k9s \
  kubectx \
  helm \
  kustomize \
  terraform 

