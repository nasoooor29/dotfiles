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

tmux rename-window -t "$project_name":1 "Editor" \;
tmux send-keys -t "$project_name":1 "nvim" C-m \;
tmux new-window -t "$project_name" -n "Terminal" \;
tmux new-window -t "$project_name" -n "Git" \;
tmux send-keys -t "$project_name":3 "lazygit" C-m \;

tmux attach-session -t "$project_name"

# Save changes to the branch
git add .
git commit -m "Update project"

# Prompt to push changes to GitHub
read -p "Do you want to push the branch $project_name to GitHub? (y/n) " push_choice
if [ "$push_choice" == "y" ]; then
    git -C "$BASE_DIR" push -u origin "$project_name"
    echo "Branch $project_name pushed to GitHub."
fi
