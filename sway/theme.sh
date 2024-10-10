#!/bin/bash

# Copy all files and directories from theme/config to ~/.config
cp -r theme/config/* ~/.config/

# Copy all files and directories from theme/etc to /etc
sudo cp -r theme/etc/* /etc/