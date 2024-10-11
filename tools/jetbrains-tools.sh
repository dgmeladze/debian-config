#!/bin/bash

# Проверка наличия jq и установка, если отсутствует
if ! command -v jq &> /dev/null; then
    echo "jq не установлен. Устанавливаю..."
    sudo apt-get update
    sudo apt-get install -y jq
fi

# Функция для установки программы
install_jetbrains() {
    local app_name=$1
    local download_url=$2
    local temp_file=$(mktemp)

    echo "Скачивание $app_name..."
    wget -O "$temp_file" "$download_url"

    echo "Установка $app_name..."
    sudo tar -xzf "$temp_file" -C /opt

    echo "Удаление архива..."
    rm "$temp_file"

    echo "$app_name установлен."
}

# Получение последней версии PhpStorm
phpstorm_url="https://download.jetbrains.com/webide/PhpStorm-2024.2.3.tar.gz"

# Получение последней версии PyCharm Community
pycharm_url="https://download.jetbrains.com/python/pycharm-community-2024.2.3.tar.gz"

# Установка
install_jetbrains "PhpStorm" "$phpstorm_url"
install_jetbrains "PyCharm Community" "$pycharm_url"
