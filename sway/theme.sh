#!/bin/bash

# Update package list
echo "Updating package list..."
sudo apt update

# Install necessary packages
echo "Installing necessary packages..."
sudo apt install -y zsh lightdm network-manager arc-theme papirus-icon-theme

# Change default shell to Zsh
echo "Changing default shell to Zsh..."
sudo chsh -s $(which zsh) $USER

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Zsh plugins
echo "Installing Zsh plugins..."
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Configure .zshrc
echo "Configuring .zshrc..."
cat <<EOL >> ~/.zshrc

# Set theme
ZSH_THEME="agnoster"

# Enable plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
EOL

# Configure Alacritty (check if config file exists)
if [ ! -f ~/.config/alacritty/alacritty.yml ]; then
  mkdir -p ~/.config/alacritty
  echo "Configuring Alacritty..."
  cat <<EOL > ~/.config/alacritty/alacritty.yml
# Alacritty configuration
shell:
  program: /usr/bin/zsh

# Window settings
window:
  opacity: 0.8  # Set the opacity level (0.0 to 1.0)
EOL
fi

# Install Chrome
echo "Installing Chrome..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb -y

# Install Telegram
echo "Installing Telegram..."
wget "https://telegram.org/dl/desktop/linux" -O /tmp/telegram.tar.xz
sudo tar -xf /tmp/telegram.tar.xz -C /opt/
sudo mv /opt/Telegram*/ /opt/telegram

# Apply themes
echo "Applying themes..."
gsettings set org.gnome.desktop.interface gtk-theme "Arc-Dark"
gsettings set org.gnome.desktop.interface icon-theme "Papirus-Dark"

# Configure Waybar
echo "Configuring Waybar..."
mkdir -p ~/.config/waybar
cat <<EOL > ~/.config/waybar/config
{
  "layer": "top",
  "position": "top",
  "modules-left": ["sway/workspaces"],
  "modules-center": ["clock"],
  "modules-right": [
    "cpu",
    "memory",
    "temperature",
    "battery",
    "network",
    "bluetooth",
    "pulseaudio",
    "weather",
    "custom/reboot",
    "custom/shutdown"
  ],
  "weather": {
    "format": "{city}: {temperature}°C",
    "interval": 600,
    "format-icons": {
      "clear-day": "",
      "clear-night": "",
      "rain": "",
      "snow": "",
      "sleet": "",
      "wind": "",
      "fog": "",
      "cloudy": "",
      "partly-cloudy-day": "",
      "partly-cloudy-night": ""
    },
    "tooltip": false,
    "location": "YOUR_CITY"
  },
  "custom/reboot": {
    "exec": "systemctl reboot",
    "format": "",
    "tooltip": "Reboot"
  },
  "custom/shutdown": {
    "exec": "systemctl poweroff",
    "format": "",
    "tooltip": "Shutdown"
  }
}
EOL

cat <<EOL > ~/.config/waybar/style.css
#custom-reboot,
#custom-shutdown {
  background-color: #ff5555;
  color: #ffffff;
  border-radius: 5px;
  padding: 5px;
  margin: 0 5px;
}

#custom-reboot:hover,
#custom-shutdown:hover {
  background-color: #ff0000;
}
EOL

# Create systemd service for Waybar
echo "Creating systemd service for Waybar..."
mkdir -p ~/.config/systemd/user
cat <<EOL > ~/.config/systemd/user/waybar.service
[Unit]
Description=Waybar
After=graphical-session.target

[Service]
ExecStart=/usr/bin/waybar
Restart=always
RestartSec=10

[Install]
WantedBy=default.target
EOL

# Enable and start Waybar service
systemctl --user enable waybar.service
systemctl --user start waybar.service

# Enable LightDM and NetworkManager
sudo systemctl enable lightdm
sudo systemctl enable NetworkManager

echo "Installation complete! Please log out and log back in for changes to take effect."