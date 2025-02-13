#!/bin/zsh

set -e  # Exit immediately if a command exits with a non-zero status

# Function to run Git commands safely
git_safe() {
  echo "Running: $@"
  "$@"
}

# Process for main
git_safe git status

git_safe git checkout main
git_safe git fetch upstream
git_safe git rebase upstream/main
git_safe git push origin main

git_safe git status
echo "All operations completed successfully!"
