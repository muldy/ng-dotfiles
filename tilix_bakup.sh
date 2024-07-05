#!/usr/bin/env bash
set -e 

# Backs up and restores tilix settings 

if [[ $1 == 'backup' ]]; then
  dconf dump '/com/gexperts/Tilix/' > tilix-settings.dconf
  echo "backup done"
  exit 0
fi
if [[ $1 == 'restore' ]]; then
  dconf load '/com/gexperts/Tilix/' < tilix-settings.dconf
  echo "restore done"
  exit 0
fi

echo "parameter 0: [backup|restore]"
