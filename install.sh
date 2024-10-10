#!/usr/bin/env bash

# Function to update sources.list based on user input
update_sources_list() {
    local version=$1
    sudo sed -i "s/bookworm/$version/g" /etc/apt/sources.list
}

# Prompt user for Debian version
echo "Select Debian version:"
echo "1. sid"
echo "2. testing"
read -p "Enter choice [1-2]: " choice

case $choice in
    1)
        update_sources_list "sid"
        ;;
    2)
        update_sources_list "testing"
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

sudo apt update
sudo apt full-upgrade
sudo apt autoremove

# Run the sway scripts sequentially
./sway/sway.sh
./sway/dependencies.sh
./sway/theme.sh

# Run all scripts in the additional directory
for script in ./additional/*.sh; do
    [ -f "$script" ] && [ -x "$script" ] && "$script"
done

# Prompt user for installing web developer tools
echo "Install web developer tools?"
echo "1. yes"
echo "2. no"
read -p "Enter choice [1-2]: " choice

if [ "$choice" -eq 1 ]; then
    # Run all scripts in the tools directory
    for script in ./tools/*.sh; do
        [ -f "$script" ] && [ -x "$script" ] && "$script"
    done
fi

systemctl enable lightdm