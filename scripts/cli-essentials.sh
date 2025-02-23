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
