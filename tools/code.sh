#!/bin/bash

# Обновляем список пакетов

echo "Installations of Visual Studio Code"
sudo touch /etc/apt/sources.list.d/vscode.sources
cat << EOF | sudo tee /etc/apt/sources.list.d/vscode.sources
# You may comment out this entry, but any other modifications may be lost.
Types: deb
URIs: https://packages.microsoft.com/repos/code
Suites: stable
Components: main
Architectures: amd64,arm64,armhf
Signed-By: /usr/share/keyrings/microsoft.gpg
EOF

wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/microsoft.gpg > /dev/null
sudo apt update
sudo apt install -y code
