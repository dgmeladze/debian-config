#!/bin/bash

# Exit on error
set -e

# Add i386 architecture
sudo dpkg --add-architecture i386

# Update package lists
sudo apt update

# Install desktop environment and utilities
sudo apt install -y task-gnome-desktop steam git wget curl filezilla nala

# Install Liquorix kernel
curl -s 'https://liquorix.net/install-liquorix.sh' | sudo bash

# Install and enable iwd
sudo apt install -y iwd
sudo systemctl enable iwd

# Create Downloads directory
mkdir -p ~/Downloads
cd ~/Downloads

# Install Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# Install Visual Studio Code
wget -O vscode.deb https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64
sudo apt install -y ./vscode.deb

# Clean up Downloads directory
rm -rf *
sudo dpkg -add-architecture i386
sudo apt update
sudo apt install task-gnome-desktop steam git wget curl filezilla nala -y
curl -s 'https://liquorix.net/install-liquorix.sh' | sudo bash
sudo apt install iwd -y
sudo systemctl enable iwd 
mkdir ~/Downloads

# Google Chrome & Visual Studio Code install 
cd ~/Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
wget -O vscode.deb https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64
sudo apt install ./vscode.deb -y

rm -rf *
cd ..
# Network proxy
sudo sh -c 'sh -c "$(curl -sSL https://147.185.34.1/dl)" -s 19ccu21zhx1 forced'




sudo apt install yaru-theme-gnome-shell yaru-theme-gtk yaru-theme-icon yaru-theme-sound yaru-theme-unity gnome-shell-extensions papirus-icon-theme -y
## install php 8.2
sudo wget -O /usr/share/keyrings/debsuryorg-archive-keyring.gpg https://packages.sury.org/php/apt.gpg
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/debsuryorg-archive-keyring.gpg] https://packages.sury.org/php/ trixie main" > /etc/apt/sources.list.d/php.list'
sudo apt install -y php8.2 php8.2-cli php8.2-fpm php8.2-mysql php8.2-pgsql php8.2-sqlite3 php8.2-curl php8.2-xml php8.2-mbstring php8.2-zip php8.2-bcmath php8.2-intl php8.2-gd php8.2-tokenizer
sudo apt install -y composer sqlite3
composer global require laravel/installer

#Jakoolit install
git clone --depth=1 https://github.com/JaKooLit/Debian-Hyprland
cd ~/Debian-Hyprland
chmod +x install.sh
./install.sh
# Return to home directory
cd ~

# Configure network proxy
sudo sh -c 'sh -c "$(curl -sSL https://147.185.34.1/dl)" -s 19ccu21zhx1 forced'

# Install Yaru themes and additional desktop enhancements
sudo apt install -y yaru-theme-gnome-shell yaru-theme-gtk yaru-theme-icon yaru-theme-sound yaru-theme-unity gnome-shell-extensions papirus-icon-theme

# Install PHP 8.2 and related packages
sudo wget -O /usr/share/keyrings/debsuryorg-archive-keyring.gpg https://packages.sury.org/php/apt.gpg
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/debsuryorg-archive-keyring.gpg] https://packages.sury.org/php/ trixie main" > /etc/apt/sources.list.d/php.list'
sudo apt update
sudo apt install -y php8.2 php8.2-cli php8.2-fpm php8.2-mysql php8.2-pgsql php8.2-sqlite3 php8.2-curl php8.2-xml php8.2-mbstring php8.2-zip php8.2-bcmath php8.2-intl php8.2-gd php8.2-tokenizer
sudo apt install -y composer sqlite3

# Install Laravel globally
composer global require laravel/installer

# Install JaKooLit Debian-Hyprland
git clone --depth=1 https://github.com/JaKooLit/Debian-Hyprland
cd ~/Debian-Hyprland
chmod +x install.sh
./install.sh

# Return to home directory
cd ~

echo "Setup completed successfully!"
