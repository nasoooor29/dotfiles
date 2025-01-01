#!/bin/bash

# Set variables
SSH_DIR="$HOME/.ssh"
TEMP_ZIP="/tmp/ssh_keys.zip"
ROLE_ZIP="$HOME/dotfiles/playbooks/roles/ssh-keys/files/ssh_keys.zip"

# Ensure the destination directory exists
mkdir -p "$(dirname "$ROLE_ZIP")"

# Navigate to the .ssh directory and create the zip
cd "$SSH_DIR" || {
    echo "Failed to navigate to $SSH_DIR"
    exit 1
}
zip -r "$TEMP_ZIP" . || {
    echo "Failed to create zip file"
    exit 1
}

# Encrypt the zip file and save it to the role location
ansible-vault encrypt "$TEMP_ZIP" --output="$ROLE_ZIP" || {
    echo "Failed to encrypt zip file"
    exit 1
}

# Clean up the temporary zip file
rm -f "$TEMP_ZIP" || {
    echo "Failed to clean up temporary zip file"
    exit 1
}

echo "Encrypted zip file successfully created at $ROLE_ZIP"
