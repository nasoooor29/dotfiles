#!/bin/bash

set -e          # Exit on any error
set -o pipefail # Exit if any command in a pipeline fails
set -u          # Treat unset variables as an error

# Ensure script is run with sudo privileges
if [[ $EUID -ne 0 ]]; then
  echo "Please run as root (use sudo)." >&2
  exit 1
fi

# Install necessary packages
echo "Installing git and base-devel..."
if ! pacman -S --needed --noconfirm git base-devel; then
  echo "Failed to install required packages." >&2
  exit 1
fi

# Create a temporary directory
TMP_DIR=$(mktemp -d)
echo "Using temporary directory: $TMP_DIR"

# Cleanup function to remove temp dir on exit
cleanup() {
  echo "Cleaning up..."
  rm -rf "$TMP_DIR"
}
trap cleanup EXIT

# Clone the yay repository into the temporary directory
echo "Cloning yay repository..."
if ! git clone https://aur.archlinux.org/yay.git "$TMP_DIR/yay"; then
  echo "Failed to clone yay repository." >&2
  exit 1
fi

# Change into the yay directory
cd "$TMP_DIR/yay" || {
  echo "Failed to enter yay directory." >&2
  exit 1
}

# Build and install yay
echo "Building and installing yay..."
if ! makepkg -si --noconfirm; then
  echo "Failed to build/install yay." >&2
  exit 1
fi

echo "yay installed successfully!"
