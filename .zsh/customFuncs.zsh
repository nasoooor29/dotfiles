
cfg() {
    ~/.config/wofi/config.sh
}

# Function to update all Zsh extensions
update_zsh() {
  for entry in "${ext[@]}"; do
    # Split the entry into components
    IFS='|' read -r dir repo activate <<< "$entry"
    
    # Update the extension if the directory exists
    if [[ -d $dir ]]; then
      echo "Updating $dir..."
      git -C "$dir" pull --rebase || echo "Failed to update $dir"
    else
      echo "$dir does not exist, skipping."
    fi
  done
}

