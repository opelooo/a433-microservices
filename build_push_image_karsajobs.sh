#!/bin/bash

# read from .env file
set -a
source .env
set +a

# Username GitHub
USERNAME=opelooo
# Nama image
IMAGE_NAME=ghcr.io/$USERNAME/karsajobs:latest

# Build image Docker
docker build -t $IMAGE_NAME .

# Login ke GitHub Container Registry
echo $GITHUB_TOKEN | docker login ghcr.io -u $USERNAME --password-stdin

# Push image
docker push $IMAGE_NAME
