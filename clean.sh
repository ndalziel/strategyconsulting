#!/bin/bash
# clean.sh - remove all files ignored by git

set -e

echo "🚀 Dry run: listing ignored files that would be deleted..."
git clean -ndX

read -p "⚠️ This will permanently delete all ignored files. Continue? (y/n): " confirm
if [[ "$confirm" != "y" ]]; then
    echo "Aborting."
    exit 0
fi

echo "🧹 Removing all ignored files..."
git clean -fdX

echo "✅ Done!"
