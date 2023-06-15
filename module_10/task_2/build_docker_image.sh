#!/bin/sh

# run this file with a version number:
# ./build_docker_image.sh 1.0.2

# User configured vars
imageName=nestjs-rest-api
userName=epamaliaksandrvarachai

# Calculated vars
if [[ -z "$1" ]]; then
  echo "Error: version must be provided"
  exit 1
fi
imageVersion="$1"

# Image building
docker build -t $imageName .

# Image publishing
docker login
docker tag $imageName $userName/$imageName:$imageVersion
docker push $userName/$imageName:$imageVersion
