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
