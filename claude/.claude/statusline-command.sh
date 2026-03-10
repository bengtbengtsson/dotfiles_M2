#!/bin/bash

# Read JSON input from stdin
input=$(cat)

# Get current directory with home replacement (similar to zsh %~)
cwd=$(pwd | sed "s|^$HOME|~|")

# Git branch function (with --no-optional-locks to avoid lock issues)
git_branch() {
    ref=$(git --no-optional-locks symbolic-ref --quiet --short HEAD 2>/dev/null || git --no-optional-locks rev-parse --short HEAD 2>/dev/null)
    if [[ -n "$ref" ]]; then
        # Check if there are uncommitted changes (dirty working tree)
        if ! git --no-optional-locks diff --quiet 2>/dev/null || ! git --no-optional-locks diff --cached --quiet 2>/dev/null; then
            echo "($ref*)"
        else
            echo "($ref)"
        fi
    fi
}

# Extract model display name
model_name=$(echo "$input" | jq -r '.model.display_name')

# Build the status line: model name, directory, git branch
echo "${model_name} ${cwd} $(git_branch)"
