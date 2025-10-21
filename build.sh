#!/bin/bash
set -euo pipefail

# replace with your DockerHub username
DOCKER_USER="${DOCKER_USER:-saraswathi6}"
IMAGE_NAME="${DOCKER_USER}/guvi-react-dev"

echo "Building image ${IMAGE_NAME}:latest ..."
docker build -t "${IMAGE_NAME}:latest" .

# tag with build id if provided
TAG="${BUILD_TAG:-latest}"
docker tag "${IMAGE_NAME}:latest" "${IMAGE_NAME}:${TAG}"

echo "Build finished: ${IMAGE_NAME}:${TAG}"

