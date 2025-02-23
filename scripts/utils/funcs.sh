# Function to install apps using pacman, accepts an array of packages as argument
install_pacman_apps() {
  local packages=("$@")
  pacman -S --needed --noconfirm "${packages[@]}"
}

install_aur_apps() {
  local packages=("$@")
  yay -S --sudoloop --needed --noconfirm --answerclean None --answerdiff None --answeredit None "${packages[@]}"
}

enable_services() {
  local services=("$@") # Accepts an array of services
  echo "Enabling services..."
  for service in "${services[@]}"; do
    systemctl enable --now "$service"
    echo "Service $service enabled and started."
  done
}
