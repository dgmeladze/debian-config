#!/usr/bin/env bash

# Install Sway and related packages
sudo apt install -y sway swaybg swayidle swaylock

# Copy Sway configuration files
mkdir -p ~/.config/sway
cp /path/to/your/sway/config ~/.config/sway/config

# Set up autostart for Sway
echo "exec sway" > ~/.xinitrc