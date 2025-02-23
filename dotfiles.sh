#!/bin/bash

set -e          # Exit on any error
set -o pipefail # Exit if any command in a pipeline fails
set -u          # Treat unset variables as an error

repo_url="https://github.com/nasoooor29/dotfiles" # Replace this with your actual repository URL
repo_dir="$HOME/dotfiles"                         # Change this to the desired local directory
scripts_dir="$repo_dir/scripts"                   # The directory containing the scripts

# Function to clone the repository and switch to the correct branch
clone_repo() {
  echo "Cloning repository..."
  if [ -d "$repo_dir" ]; then
    echo "Repository directory already exists. Pulling latest changes..."
    cd "$repo_dir" && git pull || {
      echo "Failed to pull changes."
      exit 1
    }
  else
    git clone "$repo_url" "$repo_dir" || {
      echo "Failed to clone repository."
      exit 1
    }
    cd "$repo_dir" || {
      echo "Failed to enter repository directory."
      exit 1
    }
  fi
  git switch main
}

# Get list of scripts in the "scripts" directory
get_script_options() {
  scripts_dir="$repo_dir/scripts" # Ensure this is the correct path

  # Loop through the .sh files and populate the OPTIONS array
  for script in "$scripts_dir"/*.sh; do
    if [[ -f "$script" && -x "$script" ]]; then
      script_name=$(basename "$script" .sh)                # Get the name of the script without the ".sh" extension
      echo "- $script_name"                                # Echo the script name
      OPTIONS+=("$script_name" "Install $script_name" OFF) # Add to OPTIONS array
    fi
  done
}

# Main script
echo "Starting system bootstrap..."

# Clone the repository
clone_repo

# Load utilities and install yay
source "$repo_dir/scripts/utils/funcs.sh"
bash "$repo_dir/scripts/utils/install-yay.sh"

# Declare OPTIONS outside the function
OPTIONS=()

# Call the function to populate OPTIONS
get_script_options

# Show checklist using whiptail
CHOICES=$(whiptail --title "Setup Machine" --checklist \
  "Select components to install (Space to select, Enter to confirm):" 20 78 10 \
  "${OPTIONS[@]}" 3>&1 1>&2 2>&3)
# Exit if no selection is made
if [ $? -ne 0 ]; then
  echo "No options selected. Exiting."
  exit 1
fi

# Iterate over selected options and execute scripts
SELECTED=($CHOICES)
for ITEM in "${SELECTED[@]}"; do
  SCRIPT="$scripts_dir/${ITEM}.sh"
  if [[ -f "$SCRIPT" && -x "$SCRIPT" ]]; then
    echo "Running $SCRIPT..."
    "$SCRIPT"
  else
    echo "Script $SCRIPT not found or not executable."
  fi
done

bash "$repo_dir/scripts/utils/set-default-shell.sh"
bash "$repo_dir/scripts/utils/stow.sh"
git -C "$repo_dir" submodule update --force --init --recursive --jobs 4
echo "System setup complete! Switching to zsh..."
exec zsh
