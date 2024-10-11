#!/bin/bash

# Обновляем список пакетов
echo "Обновляем список пакетов..."
sudo apt update

# Добавляем GPG ключ Microsoft
echo "Добавляем GPG ключ Microsoft..."
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

# Добавляем репозиторий Visual Studio Code
echo "Добавляем репозиторий Visual Studio Code..."
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list

# Обновляем список пакетов снова
echo "Обновляем список пакетов снова..."
sudo apt update

# Устанавливаем Visual Studio Code
echo "Устанавливаем Visual Studio Code..."
sudo apt install -y code

echo "Установка Visual Studio Code завершена!"
