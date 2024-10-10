#!/usr/bin/env bash
printf "\033[1;35m Code... \033[0m\n"
sudo apt install software-properties-common apt-transport-https curl
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

sudo apt-get update
sudo apt update
sudo apt install code -y