#!/bin/bash
# run_jekyll.sh — build and run Jekyll in Docker

IMAGE_NAME="myjekyll"

# Build the image (will skip if already up-to-date)
docker build -t $IMAGE_NAME .

# Run Jekyll
docker run --rm -it \
  -p 4000:4000 \
  -v "$(pwd)":/srv/jekyll \
  -w /srv/jekyll \
  $IMAGE_NAME
