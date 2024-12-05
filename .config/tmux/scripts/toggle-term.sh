#!/bin/bash

if [[ -z "$TMUX" ]]; then
    echo "This script must be run inside a Tmux session." >&2
    exit 1
fi

CURRENT_SESSION=$(tmux display-message -p '#S')
CURRENT_SESSION_PATH=$(tmux display-message -p -t :1 '#{pane_current_path}')
TERM_NAME="_COMMAND_TERM"

toggle() {
    if [[ $CURRENT_SESSION == *"$TERM_NAME"* ]]; then
        close
    else
        open
    fi
    exit 0
}

open() {
    TERM_SESSION_NAME="${CURRENT_SESSION}${TERM_NAME}"

    if [[ $CURRENT_SESSION != *"$TERM_NAME"* ]]; then
        tmux new-session -d -s "$TERM_SESSION_NAME" -c "$CURRENT_SESSION_PATH"
    fi

    tmux display-popup -h 75% -w 90% -E "tmux attach-session -t $TERM_SESSION_NAME"
    exit 0
}

close() {
    if [[ $CURRENT_SESSION != *"$TERM_NAME"* ]]; then
        return
    fi
    TERM_SESSION_NAME="${CURRENT_SESSION}"
    if tmux has-session -t "$TERM_SESSION_NAME" 2>/dev/null; then
        tmux detach-client -s $TERM_SESSION_NAME
    fi
    exit 0
}

if [[ $1 == "open" ]]; then
    open
    exit 0
fi

if [[ $1 == "close" ]]; then
    close
    exit 0
fi

toggle
