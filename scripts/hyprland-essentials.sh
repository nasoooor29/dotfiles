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
