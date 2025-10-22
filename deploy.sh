#!/bin/bash
<<<<<<< HEAD
<<<<<<< HEAD
echo "Deploying docker image using docker-compose..."
docker-compose down
docker-compose up -d
=======
set -euo pipefail

DOCKER_USER="${DOCKER_USER:-<DOCKER_USERNAME>}"
=======
set -euo pipefail

DOCKER_USER="${DOCKER_USER:-saraswathi6}"
>>>>>>> 44a1846 (Pushing the project files to github)
IMAGE_NAME="${DOCKER_USER}/guvi-react-dev"
TAG="${BUILD_TAG:-latest}"

echo "Pulling ${IMAGE_NAME}:${TAG}"
docker pull "${IMAGE_NAME}:${TAG}"

# write image name into docker-compose env var or override
export IMAGE_NAME="${IMAGE_NAME}:${TAG}"

# stop and start
docker compose down || true
docker compose up -d
echo "Deployed ${IMAGE_NAME}:${TAG}"
<<<<<<< HEAD

>>>>>>> 95b34f2 (Initial commit - dev branch)
=======
>>>>>>> 44a1846 (Pushing the project files to github)
