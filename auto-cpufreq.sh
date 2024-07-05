#!/bin/bash
set -u 

git clone https://github.com/AdnanHodzic/auto-cpufreq.git $HOME/git/auto-cpufreq
cd $HOME/git/auto-cpufreq && sudo ./auto-cpufreq-installer
