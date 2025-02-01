project_name=$(ls "$BASE_DIR" | fzf)
if [ -z "$project_name" ]; then
    echo "No project selected!"
    return
fi

project_path="$BASE_DIR/$project_name"
cd "$project_path"

# Switch to the project branch
git -C "$BASE_DIR" checkout "$project_name" 2>/dev/null || echo "Branch $project_name does not exist!"

# Open tmux session
if tmux info &>/dev/null; then
    tmux new-session -d -s "$project_name" \;
else
    tmux new-session -d -s "$project_name" \;
fi
