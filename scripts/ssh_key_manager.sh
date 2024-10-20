#!/bin/bash

set -e

# Get the directory of the script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SSH_DIR="$HOME/.ssh"
ARCHIVE_NAME="$SCRIPT_DIR/.ssh_keys.zip"
ENCRYPTED_NAME="$ARCHIVE_NAME.enc"

# Function to display usage
usage() {
    echo "Usage: $0 {save|use}"
    exit 1
}

# Check if arguments are provided
if [ $# -ne 1 ]; then
    usage
fi

# Save mode
if [ "$1" == "save" ]; then
    # Check if .ssh directory exists
    if [ ! -d "$SSH_DIR" ]; then
        echo "Error: $SSH_DIR does not exist."
        exit 1
    fi

    # Create zip file without directory structure
    (cd "$SSH_DIR" && zip -r "$ARCHIVE_NAME" *)  # Change to SSH_DIR and zip its contents

    # Prompt for password
    read -s -p "Enter password for encryption: " password
    echo

    # Encrypt the zip file with PBKDF2
    openssl enc -aes-256-cbc -salt -pbkdf2 -in "$ARCHIVE_NAME" -out "$ENCRYPTED_NAME" -k "$password"

    # Remove the unencrypted zip file
    rm "$ARCHIVE_NAME"

    echo "SSH keys saved and encrypted to $ENCRYPTED_NAME."

# Use mode
elif [ "$1" == "use" ]; then
    # Check if encrypted archive exists
    if [ ! -f "$ENCRYPTED_NAME" ]; then
        echo "Error: $ENCRYPTED_NAME does not exist. Please save your keys first."
        exit 1
    fi

    # Prompt for password
    read -s -p "Enter password for decryption: " password
    echo

    # Decrypt the zip file
    openssl enc -d -aes-256-cbc -pbkdf2 -in "$ENCRYPTED_NAME" -out "$ARCHIVE_NAME" -k "$password"

    # Unzip the archive into the SSH directory without paths
    unzip -o "$ARCHIVE_NAME" -d "$SSH_DIR"

    # Remove the decrypted zip file
    rm "$ARCHIVE_NAME"

    echo "SSH keys decrypted and restored to $SSH_DIR."

else
    usage
fi

