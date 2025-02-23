#!/bin/bash

# Get the current username (you can replace it with a specific username if needed)
USER="${USER:-$(whoami)}"

# Run stow command
STOW_DIR="/home/$USER/dotfiles"
TARGET_DIR="/home/$USER"

# Run stow with --adopt to create symlinks
stow --adopt "$STOW_DIR" --target "$TARGET_DIR"

# Check if the command was successful
if [[ $? -eq 0 ]]; then
  echo "Stow completed successfully."
else
  echo "Stow failed." >&2
  exit 1
fi
