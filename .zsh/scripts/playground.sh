#!/bin/bash

# Base directory for your projects and playgrounds
BASE_DIR="$HOME/repos/playground"
rm -rf $BASE_DIR/*
BASE_PLAGROUND="$HOME/.zsh/scripts/playground"

# Ensure BASE_DIR exists
mkdir -p "$BASE_DIR"

if [[ ! -d $BASE_DIR/.git ]]; then
    git init "$BASE_DIR"
fi

# Function to initialize a new project/playground

choice=$($BASE_PLAGROUND/ask.sh "wdyw?" open new)
if [[ ! -n "$choice" ]]; then
    exit 1
fi

# Handle the selection
case $choice in
"new")
    source $BASE_PLAGROUND/create-project.sh
    ;;
"open")
    echo "open"
    ;;
*) ;;
esac
