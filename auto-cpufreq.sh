#!/usr/bin/env bash
set -e 

if [ -d "/sys/class/power_supply/BAT0" ]; then
    git clone https://github.com/AdnanHodzic/auto-cpufreq.git "$HOME/git/auto-cpufreq"
    cd "$HOME/git/auto-cpufreq && sudo ./auto-cpufreq-installer"
    sudo cp auto-cpufreq.conf /etc/
else
  echo -e "\nNo Battery detected"
fi

