if [[ -z "$TMUX" ]]; then
    echo "This script must be run inside a Tmux session." >&2
    exit 1
fi

CURRENT_SESSION=$(tmux display-message -p '#S')
CURRENT_SESSION_PATH=$(tmux display-message -p -t :1 '#{pane_current_path}')
TERM_NAME="_COMMAND_TERM"

if [[ $CURRENT_SESSION == *"$TERM_NAME"* ]]; then
    TERM_SESSION_NAME="${CURRENT_SESSION}"
    # tmux set-option -t $TERM_SESSION_NAME status off
    tmux detach-client -s $TERM_SESSION_NAME
    exit 0
else
    TERM_SESSION_NAME="${CURRENT_SESSION}${TERM_NAME}"
fi

if ! tmux has-session -t "$TERM_SESSION_NAME" 2>/dev/null; then
    tmux new-session -d -s "$TERM_SESSION_NAME" -c "$CURRENT_SESSION_PATH"
fi

# tmux set-option -t $TERM_SESSION_NAME status off
tmux display-popup -h 75% -w 90% -E "tmux attach-session -t $TERM_SESSION_NAME"
