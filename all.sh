#!/bin/bash

# Example of calling the function with an array of packages
essential_apps=(
  neovim
  man-db
  unzip
  zip
  zsh
  stow
  wget
  git
  eza
  jq
  sshfs
  zoxide
  tmux
  ripgrep
)

aur_essential_apps=(
  fzf-git
  sesh-bin
)

# Call the function with the array
install_pacman_apps "${essential_apps[@]}"
install_aur_apps "${aur_essential_apps[@]}"

echo "Installation of essential apps."

optional_apps=(
  ansible-core
  openssh
  bat
  btop
  net-tools
  bind
  docker
)

aur_optional_apps=(
  lazydocker
  lazysql
)

services_to_enable=(
  docker
  sshd
)

install_pacman_apps "${optional_apps[@]}"
install_aur_apps "${aur_optional_apps[@]}"
enable_services "${services_to_enable[@]}"

echo "Installation of optional apps and services completed."

programming_apps=(
  npm
  python
  go
  lazygit
  make
)

install_pacman_apps "${programming_apps[@]}"

echo "Installation of programming languages and tools is done."

# Array of Hyprland essential pacman packages
hyprland_pacman_apps=(
  nwg-look
  ly
  wofi
  xdg-desktop-portal-hyprland
  pipewire
  pipewire-pulse
  ntfs-3g
  ttf-jetbrains-mono-nerd
  wireplumber
  dunst
  thunar
  firefox
  gparted
  hyprland
  kitty
  gnome-themes-extra
  adwaita-qt5-git
  adwaita-qt6-git
)

# Array of Hyprland essential AUR packages
hyprland_aur_apps=(
  aylurs-gtk-shell
  clipman
  vencord
  google-chrome
  gtk # may need to be removed
)

# Install Hyprland essential pacman apps
install_pacman_apps "${hyprland_pacman_apps[@]}"
install_aur_apps "${hyprland_aur_apps[@]}"
enable_service "ly"

echo "Hyprland setup completed successfully."

# Array of laptop Hyprland essential pacman packages
laptop_hyprland_pacman_apps=(
  brightnessctl
  bluez-utils
  impala
  iwd
)

# Array of laptop Hyprland essential AUR packages
laptop_hyprland_aur_apps=(
  bluetui-bin
)

install_pacman_apps "${laptop_hyprland_pacman_apps[@]}"
install_aur_apps "${laptop_hyprland_aur_apps[@]}"

echo "Laptop Hyprland setup completed successfully."

# Array of Hyprland optional AUR packages
hyprland_optional_aur_apps=(
  onlyoffice-bin
)

# Install Hyprland optional AUR apps
install_aur_apps "${hyprland_optional_aur_apps[@]}"

echo "Hyprland optional AUR apps installation completed."
