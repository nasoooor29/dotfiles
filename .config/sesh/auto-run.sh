if [[ "$(pwd)" != "$HOME/repos"* ]]; then
    exit 0
fi

if tmux list-windows | grep -q "^2:"; then
    tmux kill-window -t 2
fi
tmux new-window -t 2

if tmux list-windows | grep -q "^3:"; then
    tmux kill-window -t 3
fi

tmux new-window -t 3
tmux send-keys -t 3 'lazygit' C-m

tmux select-window -t 1
nvim -c 'Telescope find_files'
