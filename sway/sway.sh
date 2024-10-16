#!/usr/bin/env bash

# Install Sway and related packages
sudo apt install -y sway swaybg swayidle swaylock

# Set up autostart for Sway
echo "exec sway" > ~/.xinitrc
