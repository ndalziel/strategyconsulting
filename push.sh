#!/bin/bash
# push.sh - Commit and push changes to GitHub

# Stage all changes
git add .

# Commit with a message (pass as first argument, default to "update")
git commit -m "${1:-update}"

# Push to current branch (assumes upstream is set)
git push