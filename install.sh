#!/usr/bin/env bash
git clone 'https://github.com/redclimb/debian-sway-config.git'
cd ./debian-sway-config
chmod +x ./sway.sh
chmod +x ./local.sh
chmod +x ./customization.sh
./sway.sh
./local.sh
./customization.sh
## Update cache ##
printf "\033[1;35m Updating cache... \033[0m\n"
sudo apt update && sudo apt upgrade


## visual code ##
printf "\033[1;35m Code... \033[0m\n"
sudo apt install software-properties-common apt-transport-https curl
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

## google chrome ##
printf "\033[1;35m Chrome... \033[0m\n"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb


## jetbrains ##
printf "\033[1;35m Jetbrains... \033[0m\n"
curl -s https://s3.eu-central-1.amazonaws.com/jetbrains-ppa/0xA6E8698A.pub.asc | gpg --dearmor | sudo tee /usr/share/keyrings/jetbrains-ppa-archive-keyring.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/jetbrains-ppa-archive-keyring.gpg] http://jetbrains-ppa.s3-website.eu-central-1.amazonaws.com any main" | sudo tee /etc/apt/sources.list.d/jetbrains-ppa.list > /dev/null

## telegram ##
printf "\033[1;35m Telegram... \033[0m\n"
wget "https://telegram.org/dl/desktop/linux" -O /tmp/telegram.tar.xz


## update again ##
sudo apt-get update
sudo apt update

## installation web developer minimum ##
printf "\033[1;35m Installing, man, take a coffee... \033[0m\n"
sudo apt install code apt filezilla
sudo apt install pycharm-community
sudo apt install phpstorm 
sudo tar -xf /tmp/telegram.tar.xz -C /opt/
sudo mv /opt/Telegram*/ /opt/telegram
