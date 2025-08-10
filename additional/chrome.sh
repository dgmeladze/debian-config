#!/usr/bin/env bash
printf "\033[1;35m Chrome... \033[0m\n"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt install -f -y # Resolve any dependency issues
rm google-chrome-stable_current_amd64.deb
