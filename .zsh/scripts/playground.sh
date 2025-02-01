#!/bin/bash

# Base directory for your projects and playgrounds
BASE_DIR="$HOME/repos/playground"
rm -rf $BASE_DIR/*
BASE_PLAGROUND="$HOME/.zsh/scripts/playground"

if [[ ! -d $BASE_DIR/.git ]]; then
    echo "please clone your repo"
    exit 1
fi

# Function to initialize a new project/playground
choice=$($BASE_PLAGROUND/ask-choice.sh "what do you want?" "open" "new" "clear")
if [[ ! -n "$choice" ]]; then
    exit 1
fi

if [ "$choice" = "new" ]; then
    echo "new"
elif [ "$choice" = "open" ]; then
    echo "open"
elif [ "$choice" = "clear" ]; then
    echo "clear"
fi
