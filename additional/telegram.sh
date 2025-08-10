#!/usr/bin/env bash
printf "\033[1;35m Telegram... \033[0m\n"
wget https://telegram.org/dl/desktop/linux -O telegram.tar.xz
tar -xJf telegram.tar.xz
sudo mv Telegram /opt/Telegram
sudo ln -s /opt/Telegram/Telegram /usr/local/bin/telegram
rm telegram.tar.xz
