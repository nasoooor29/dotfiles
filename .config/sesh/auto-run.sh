if tmux list-windows | grep -q "^2:"; then
    tmux kill-window -t 2
fi
if tmux list-windows | grep -q "^3:"; then
    tmux kill-window -t 3
fi

# FIX: make it independent
tmux select-window -t 1
~/dotfiles/.config/tmux/scripts/toggle-window.sh run

tmux new-window -t 2
tmux new-window -t 3
tmux send-keys -t 3 'cd backend && lazygit' C-m
nvim -c 'Telescope find_files'
tmux select-window -t 1
