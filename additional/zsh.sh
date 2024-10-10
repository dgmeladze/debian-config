#!/bin/bash

# Обновление списка пакетов
echo "Обновление списка пакетов..."
sudo apt update

# Установка Zsh
echo "Установка Zsh..."
sudo apt install -y zsh\

# Смена оболочки на Zsh
echo "Смена оболочки на Zsh..."
chsh -s $(which zsh)

# Установка Oh My Zsh
echo "Установка Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Установка плагинов
echo "Установка плагинов..."
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Настройка .zshrc
echo "Настройка .zshrc..."
cat <<EOL >> ~/.zshrc

# Установка темы
ZSH_THEME="agnoster"

# Подключение плагинов
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
EOL

# Настройка Alacritty (проверка наличия файла конфигурации)
if [ ! -f ~/.config/alacritty/alacritty.yml ]; then
  mkdir -p ~/.config/alacritty
  echo "Настройка Alacritty..."
  cat <<EOL > ~/.config/alacritty/alacritty.yml
# Конфигурация Alacritty
shell:
  program: /usr/bin/zsh
EOL
fi

echo "Установка завершена! Пожалуйста, выйдите и войдите в систему, чтобы изменения вступили в силу."
