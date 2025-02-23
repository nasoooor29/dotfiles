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
