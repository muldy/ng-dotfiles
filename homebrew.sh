#!/usr/bin/env bash
set -e 

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

/home/linuxbrew/.linuxbrew/bin/brew install \
  k9s \
  kubectx \
  helm \
  kustomize \
  terraform 

