if [[ -z "$1" ]]; then
    echo "Error: No module name provided."
    exit 1
fi

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
