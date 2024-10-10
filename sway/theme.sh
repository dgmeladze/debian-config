# Here will be theme dotfiles config
#!/bin/bash
mkdir -p ~/.config/sway

# Создание конфигурационного файла для Sway
cat <<EOL > ~/.config/sway/config
# Установите тему
set \$bg-color #282a36
set \$fg-color #f8f8f2

# Настройка фонового изображения
exec swaybg -i ~/path/to/your/background.jpg -m fill

# Установите Waybar
exec waybar

# Настройки клавиш
bindsym \$mod+Return exec alacritty
bindsym \$mod+d exec bemenu-run
bindsym \$mod+Shift+e exec swaymsg exit
EOL

# Создание конфигурационной директории для Waybar
mkdir -p ~/.config/waybar

# Создание конфигурационного файла для Waybar
cat <<EOL > ~/.config/waybar/config
{
    "layer": "top",
    "position": "top",
    "width": "100%",
    "height": 30,
    "background": "#282a36",
    "foreground": "#f8f8f2",
    "modules-left": ["sway/workspaces", "sway/window"],
    "modules-center": [],
    "modules-right": ["battery", "clock"]
}
EOL

# Создание конфигурационного файла для Zsh
cat <<EOL > ~/.zshrc
# Загрузка Oh My Zsh
export ZSH="\$HOME/.oh-my-zsh"

# Установка темы
ZSH_THEME="agnoster"

# Загрузка плагинов
plugins=(git)

source \$ZSH/oh-my-zsh.sh
EOL