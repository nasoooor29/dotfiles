#!/bin/bash

# Array of Hyprland optional AUR packages
hyprland_optional_aur_apps=(
  onlyoffice-bin
)

# Install Hyprland optional AUR apps
install_aur_apps "${hyprland_optional_aur_apps[@]}"

echo "Hyprland optional AUR apps installation completed."
