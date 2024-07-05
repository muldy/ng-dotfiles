#!/usr/bin/env bash
set -e 

curl -fsSL https://tailscale.com/install.sh | sh

sudo tailscale set --operator=$USER
