#!/bin/bash

# Check if source and destination are provided
if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <source_directory> <destination_file>"
    exit 1
fi

# Get source and destination from arguments
SRC_DIR="$1"
DST_FILE="$2"
CURRENT_WORKING_DIR="$(pwd)"

# Generate a unique temporary file path using mktemp
TEMP_ZIP=$(mktemp --suffix=".zip")
rm -rf $TEMP_ZIP

# Ensure source directory exists
if [[ ! -d "$SRC_DIR" ]]; then
    echo "Error: Source directory $SRC_DIR does not exist."
    exit 1
fi

# Ensure destination directory exists
mkdir -p "$(dirname "$DST_FILE")"

# Navigate to the source directory and create the zip
cd "$SRC_DIR" || {
    echo "Failed to navigate to $SRC_DIR"
    exit 1
}
zip -r "$TEMP_ZIP" . || {
    echo "Failed to create zip file"
    exit 1
}
# Encrypt the zip file and save it to the destination
ansible-vault encrypt "$TEMP_ZIP" --output="$CURRENT_WORKING_DIR/$DST_FILE" || {
    echo "Failed to encrypt zip file"
    exit 1
}

# Clean up the temporary zip file
rm -f "$TEMP_ZIP" || {
    echo "Failed to clean up temporary zip file"
    exit 1
}

echo "Encrypted zip file successfully created at $DST_FILE"
