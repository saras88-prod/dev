#!/bin/bash
<<<<<<< HEAD
<<<<<<< HEAD
echo "Building docker image..."
docker build -t guvi-react-app:latest .
=======
set -euo pipefail

# replace with your DockerHub username
DOCKER_USER="${DOCKER_USER:-<DOCKER_USERNAME>}"
=======
set -euo pipefail

# replace with your DockerHub username
DOCKER_USER="${DOCKER_USER:-saraswathi6}"
>>>>>>> 44a1846 (Pushing the project files to github)
IMAGE_NAME="${DOCKER_USER}/guvi-react-dev"

echo "Building image ${IMAGE_NAME}:latest ..."
docker build -t "${IMAGE_NAME}:latest" .

# tag with build id if provided
TAG="${BUILD_TAG:-latest}"
docker tag "${IMAGE_NAME}:latest" "${IMAGE_NAME}:${TAG}"

echo "Build finished: ${IMAGE_NAME}:${TAG}"
<<<<<<< HEAD

>>>>>>> 95b34f2 (Initial commit - dev branch)
=======
>>>>>>> 44a1846 (Pushing the project files to github)
