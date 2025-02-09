#!/bin/bash

# Base directory for your projects and playgrounds
BASE_DIR="$HOME/repos/playground"
rm -rf "${BASE_DIR:?}/*"

BASE_PLAGROUND="$HOME/.zsh/scripts/playground"
PLAYGROUND_LANGS="$BASE_PLAGROUND/langs"
SESSION_NAME="playground"

display() {
    "$BASE_PLAGROUND/display.sh" "$@"
}
ask() {
    "$BASE_PLAGROUND/ask.sh" "$@"
}
ask_choice() {
    "$BASE_PLAGROUND/ask-choice.sh" "$@"
}

create_project() {
    cd "$BASE_DIR" || exit
    if ! "$PLAYGROUND_LANGS/$PG_LANG_SCRIPT" "$1" >/dev/null; then
        display "Project creation failed"
        exit 0 # it's exit 1 but just to shut tmux
    fi

    git -C "$BASE_DIR" add "$BASE_DIR" >/dev/null
    git -C "$BASE_DIR" commit -m "init" >/dev/null
}

if [[ ! -d $BASE_DIR/.git ]]; then
    display "please clone your repo"
    exit 0 # it's exit 1 but just to shut tmux
fi

backup_and_connect() {
    if [[ -n $(git -C "$BASE_DIR" status --porcelain) ]]; then
        git -C "$BASE_DIR" add "$BASE_DIR" >/dev/null
        git -C "$BASE_DIR" commit -m "BACKUP PLAYGROUND" >/dev/null
    fi
    if git -C "$BASE_DIR" show-ref --verify --quiet "refs/heads/$1"; then
        git -C "$BASE_DIR" switch "$1" >/dev/null
    else
        git -C "$BASE_DIR" switch --orphan "$1" >/dev/null
        # git -C "$BASE_DIR" rm -rf . >/dev/null
    fi

    if tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
        tmux kill-session -t "$SESSION_NAME"
    fi

    sesh connect "$BASE_DIR"
}

# current_branch=$(git -C "$BASE_DIR" rev-parse --abbrev-ref HEAD)
branches=$(git -C "$BASE_DIR" branch --sort=-committerdate --format '%(refname:short)' | grep -v "main")
COMMAND=$(ask_choice "Select a branch" "new" "clear" "unpack" "fetch-all" "$branches")

if [[ -z "$COMMAND" ]]; then
    exit 0
fi

if [ "$COMMAND" == "new" ]; then
    PROJECT_NAME=$(ask "Playground name")
    if [[ -z $PROJECT_NAME ]]; then
        display "Please give valid name"
        exit 0 # it's exit 1 but just to shut tmux
    fi

    if [[ $PROJECT_NAME == *"main"* ]]; then
        display "bad boy"
        exit 0 # it's exit 1 but just to shut tmux
    fi

    if git -C "$BASE_DIR" branch --sort=-committerdate --format '%(refname:short)' | grep -qw "$PROJECT_NAME"; then
        display "Branch name already exists."
        exit 0 # it's exit 1 but just to shut tmux
    fi

    PG_LANG_SCRIPT=$(ask_choice "Select a lang" "$(ls "$PLAYGROUND_LANGS")")
    if [[ -z $PG_LANG_SCRIPT ]]; then
        display "Please select invalid language"
        exit 0 # it's exit 1 but just to shut tmux
    fi

    backup_and_connect "$PROJECT_NAME"
    create_project "$PROJECT_NAME" >/dev/null &
elif [ "$COMMAND" = "clear" ]; then
    PROJECT_NAME=$(ask "Are you sure?")
    if [[ "$PROJECT_NAME" != "YES" ]]; then
        display "come when you are sure"
        exit 0 # it's exit 1 but just to shut tmux
    fi
    git -C "$BASE_DIR" restore "$BASE_DIR" >/dev/null
    git -C "$BASE_DIR" switch main >/dev/null
    git -C "$BASE_DIR" branch | grep -v "main" | xargs git -C "$BASE_DIR" branch -D >/dev/null
    display "All local branches deleted"
    exit 0
elif [ "$COMMAND" = "unpack" ]; then
    branches=$(git -C "$BASE_DIR" branch --sort=-committerdate --format '%(refname:short)' | grep -v "main")
    selected_branch=$(ask_choice "Select a branch" "$branches")
    dir_name=$selected_branch

    if [ ! -d "$HOME/repos/$selected_branch" ]; then
        mkdir -p "$HOME/repos/$selected_branch"
    else
        while [ -d "$HOME/repos/$dir_name" ]; do
            dir_name=$(ask "new name please: ")
        done
        mkdir -p "$HOME/repos/$dir_name"
    fi

    git clone --branch "$selected_branch" --single-branch "$BASE_DIR" "$HOME/repos/$dir_name"
    sesh connect "$HOME/repos/$dir_name"

elif [ "$COMMAND" = "fetch-all" ]; then
    git -C "$BASE_DIR" fetch --all
    for branch in $(git -C "$BASE_DIR" branch -r | grep -v '\->' | sed 's/origin\///'); do
        if ! git -C "$BASE_DIR" show-ref --verify --quiet "refs/heads/$branch"; then
            git -C "$BASE_DIR" branch --track "$branch" "origin/$branch" >/dev/null
        fi
    done
else
    backup_and_connect "$COMMAND"
    cd "$BASE_DIR" || exit
    exit 0
fi
