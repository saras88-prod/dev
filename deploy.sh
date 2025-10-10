#!/bin/bash
echo "Deploying docker image using docker-compose..."
docker-compose down
docker-compose up -d
