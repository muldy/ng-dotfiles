#!/bin/bash
set -u
curl -fsSL https://tailscale.com/install.sh | sh

sudo tailscale set --operator=$USER
