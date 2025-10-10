#!/bin/bash

# Read JSON input from stdin
input=$(cat)

# Extract model display name
model_name=$(echo "$input" | jq -r '.model.display_name')

# Get current directory
cwd=$(pwd)

# Git branch function (with --no-optional-locks to avoid lock issues)
git_branch() {
    ref=$(git --no-optional-locks symbolic-ref --quiet --short HEAD 2>/dev/null || git --no-optional-locks rev-parse --short HEAD 2>/dev/null)
    [[ -n "$ref" ]] && echo "($ref)"
}

# Build the status line: model name, then directory, then git branch
echo "${model_name} ${cwd} $(git_branch)"
