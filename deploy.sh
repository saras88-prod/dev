#!/bin/bash
set -euo pipefail

DOCKER_USER="${DOCKER_USER:-<DOCKER_USERNAME>}"
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

