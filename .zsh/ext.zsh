# Define an array of extensions with paths, repos, and activation files
ext=(
  "$HOME/.zsh/p10k|https://github.com/bhilburn/powerlevel9k.git|$HOME/.zsh/p10k/powerlevel9k.zsh-theme" 
  "$HOME/.zsh/zsh-autosuggestions|https://github.com/zsh-users/zsh-autosuggestions.git|$HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" 
  "$HOME/.zsh/zsh-syntax-highlighting|https://github.com/zsh-users/zsh-syntax-highlighting.git|$HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" 
  "$HOME/.zsh/supercharge|https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/supercharge.git|$HOME/.zsh/supercharge/supercharge.plugin.zsh" 
)

# Loop through the array
for entry in "${ext[@]}"; do
  # Split the entry into components
  IFS='|' read -r dir repo activate <<< "$entry"
  
  # Check if the directory exists, clone if necessary
  if [[ ! -d $dir ]]; then
    echo "Cloning $repo into $dir..."
    git clone "$repo" "$dir"
  fi

  # Source the activation file if it exists
  if [[ -f $activate ]]; then
    # echo "Sourcing $activate..."
    source "$activate"
  else
    echo "Activation file $activate not found."
  fi
done

autoload -Uz compinit
compinit
