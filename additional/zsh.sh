#!/bin/bash

# Update package list
echo "Updating package list..."
sudo apt update

# Install Zsh
echo "Installing Zsh..."
sudo apt install -y zsh

# Change default shell to Zsh
echo "Changing default shell to Zsh..."
sudo chsh -s $(which zsh) $USER

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install plugins
echo "Installing plugins..."
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

echo "Installation complete! Please log out and log back in for changes to take effect."