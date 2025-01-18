#!/bin/bash

repo_url="https://github.com/nasoooor29/dotfiles" # Replace this with your actual repository URL
repo_dir="$HOME/dotfiles"                         # Change this to the desired local directory

# Function to install Git and Ansible on Arch-based systems
install_dependencies_arch() {
  echo "Installing Git and Ansible on Arch Linux-based distribution..."
  # sudo pacman -Syu --noconfirm git ansible
  echo skip
}

# Function to detect the OS and install dependencies
install_dependencies() {
  if [ -f /etc/os-release ]; then
    source /etc/os-release
    case "$ID" in
    arch | manjaro)
      install_dependencies_arch
      ;;
    *)
      echo "This script currently supports Arch Linux-based distributions only."
      exit 1
      ;;
    esac
  else
    echo "Cannot detect the operating system. /etc/os-release not found."
    exit 1
  fi
}

# Function to clone the repository with Ansible roles
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
  git checkout ansible
}

# Function to execute the Ansible playbook
run_playbook() {
  cd $repo_dir
  local playbook="playbook.yml" # Replace with the actual playbook file name if different

  echo "Running Ansible playbook..."
  if [ ! -f "$playbook" ]; then
    echo "Error: $playbook not found in the repository directory."
    exit 1
  fi

  ansible-playbook "$playbook" "$@" || {
    echo "Failed to execute playbook."
    exit 1
  }
}

# Main script
echo "Starting system bootstrap..."
install_dependencies
clone_repo
run_playbook "$@" # Pass all additional arguments to the playbook

echo "System setup complete! Switching to zsh..."
exec zsh
