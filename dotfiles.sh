#!/bin/bash

# Function to install Ansible on Ubuntu/Debian-based distributions
install_ansible_debian() {
  echo "Updating apt package list..."
  sudo apt update

  echo "Installing Ansible on Ubuntu/Debian-based distribution..."
  sudo apt install -y software-properties-common
  sudo add-apt-repository --yes --update ppa:ansible/ansible
  sudo apt install -y ansible
}

# Function to install Ansible on RHEL/CentOS/Fedora-based distributions
install_ansible_rhel() {
  echo "Installing EPEL repository..."
  sudo yum install -y epel-release || sudo dnf install -y epel-release

  echo "Installing Ansible on RHEL/CentOS/Fedora-based distribution..."
  sudo yum install -y ansible || sudo dnf install -y ansible
}

# Function to install Ansible on SUSE-based distributions
install_ansible_suse() {
  echo "Installing Ansible on openSUSE/SLES-based distribution..."
  sudo zypper install -y ansible
}

# Function to install Ansible on Arch Linux and Arch-based distributions
install_ansible_arch() {
  echo "Installing Ansible on Arch Linux-based distribution..."
  sudo pacman -Syu --noconfirm ansible
}

# Check the Linux distribution and install Ansible accordingly
if [ -f /etc/os-release ]; then
  . /etc/os-release

  case "$ID" in
  ubuntu | debian)
    install_ansible_debian
    ;;
  centos | rhel | fedora)
    install_ansible_rhel
    ;;
  suse | opensuse)
    install_ansible_suse
    ;;
  arch | manjaro)
    install_ansible_arch
    ;;
  *)
    echo "Unsupported distribution: $ID"
    exit 1
    ;;
  esac
else
  echo "Unable to detect distribution. This script only works on Linux-based systems."
  exit 1
fi

# Check if Ansible was installed successfully
if command -v ansible >/dev/null 2>&1; then
  echo "Ansible has been installed successfully!"
else
  echo "Ansible installation failed!"
  exit 1
fi
