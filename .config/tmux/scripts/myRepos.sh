p=$(ls "$HOME/repos" | fzf-tmux -p 70%,60%  --border \
    --no-header \
    --no-sort --ansi --border-label ' My Repos ' --prompt '  ' --border=rounded \
    --bind 'tab:down,btab:up' \
    --bind 'alt-k:up,alt-j:down'\
    --bind alt-p:abort
)


if [ -n "$p" ]; then
    # Save the target directory path
    target_dir="$HOME/repos/$p"
    if [ -d "$target_dir" ]; then
        # Open nvim in a new terminal session
        cd "$target_dir" || { echo "Failed to change directory to $target_dir"; exit 1; }
        nvim
    else
        echo "Selected path is not a valid directory: $target_dir"
    fi
else
    echo "No selection made."
fi
