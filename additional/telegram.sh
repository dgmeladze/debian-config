#!/usr/bin/env bash
printf "\033[1;35m Telegram... \033[0m\n"
wget "https://telegram.org/dl/desktop/linux" -O /tmp/telegram.tar.xz
sudo tar -xf /tmp/telegram.tar.xz -C /opt/
sudo mv /opt/Telegram*/ /opt/telegram
