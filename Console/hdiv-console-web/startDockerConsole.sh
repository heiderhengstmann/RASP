#!/bin/bash
echo "Starting Console..."
docker-compose -f ./docker/docker-compose.yml up --build -d

echo "Showing logs..."
docker-compose -f docker/docker-compose.yml logs -f
