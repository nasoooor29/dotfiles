#!/bin/bash

programming_apps=(
  npm
  python
  go
  lazygit
  make
)

install_pacman_apps "${programming_apps[@]}"

echo "Installation of programming languages and tools is done."
