#!/bin/bash

# Get the username (replace with the actual username or use the current user)
USER="${USER:-$(whoami)}"

# Set the desired shell (replace with the desired shell path)
DESIRED_SHELL="/bin/zsh"

# Check if the desired shell exists
if ! [ -x "$DESIRED_SHELL" ]; then
  echo "Shell $DESIRED_SHELL not found." >&2
  exit 1
fi

# Change the user's shell
sudo chsh -s "$DESIRED_SHELL" "$USER"

echo "Shell for user $USER has been set to $DESIRED_SHELL."
