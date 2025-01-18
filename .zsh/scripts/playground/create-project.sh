#!/bin/bash

# Base directory
BASE_DIR="$HOME/repos/playground"

# Ensure BASE_DIR exists
mkdir -p "$BASE_DIR"

# Initialize Git if not already initialized
if [[ ! -d "$BASE_DIR/.git" ]]; then
    git -C "$BASE_DIR" init
fi

while true; do
    # Ask for the project name
    read "project name: " project_name

    # Exit if no input is provided
    if [[ -z "$project_name" || $? == 1 ]]; then
        echo "No project name provided. Exiting."
        continue
    fi

    # Check if the branch already exists
    if git -C "$BASE_DIR" rev-parse --verify "$project_name" >/dev/null 2>&1; then
        # Ask if the user wants to check out the branch
        choice=$("$BASE_PLAGROUND/ask.sh" "Branch '$project_name' exists. Do you want to checkout or choose another name? (checkout/another): " "checkout" "another")
        case $choice in
        checkout)
            git -C "$BASE_DIR" switch "$project_name"
            echo "Switched to branch '$project_name'."
            break
            ;;
        another)
            echo "Please choose another name."
            continue
            ;;
        *)
            echo "Invalid choice. Please try again."
            continue
            ;;
        esac
    else
        # If the branch doesn't exist, create it
        git -C "$BASE_DIR" checkout -b "$project_name"
        echo "Created and switched to branch '$project_name'."
        break
    fi
done

# Create the project directory
project_path="$BASE_DIR/$project_name"
mkdir -p "$project_path"
cd "$project_path" || exit 1

echo "Project setup complete in $project_path."

# Setup language-specific files
#
lang=$(echo -e "go\npython" | fzf --prompt="Choose language: ")
case $lang in
go)
    $BASE_PLAGROUND/go.sh $project_name
    ;;
python)
    $BASE_PLAGROUND/python.sh $project_name
    ;;
*)
    echo "Unsupported language!"
    return
    ;;
esac
