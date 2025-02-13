#!/bin/zsh

set -e  # Exit immediately if a command exits with a non-zero status

# Function to run Git commands safely
git_safe() {
  echo "Running: $@"
  "$@"
}

# Process for logging-docs-6.2-416
git_safe git status

git_safe git checkout enterprise-4.16
git_safe git fetch upstream
git_safe git rebase upstream/enterprise-4.16
git_safe git push origin enterprise-4.16

git_safe git checkout logging-docs-6.2-4.16
git_safe git rebase upstream/logging-docs-6.2-4.16
git_safe git rebase upstream/enterprise-4.16
git_safe git push --force upstream logging-docs-6.2-4.16

git_safe git status
echo "All operations completed successfully!"
