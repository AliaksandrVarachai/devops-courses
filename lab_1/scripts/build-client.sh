#!/usr/bin/env bash

# example 1 (production)
# ./build-client.sh production
#
# example 2 (non-production)
# ./build-client.sh

configurationParam=$1
export ENV_CONFIGURATION=$configurationParam

sourceDir=dist
artifactName=client-app.zip

source count-files-recursively.sh

npm install
# Answers "no" for request of using stats
yes n | npm run build -- --configuration=$ENV_CONFIGURATION

# Calculates files recursively in sourceDir
countFilesRecursively $sourceDir

# builds artifact
if [ -e $artifactName ]; then
  rm $artifactName
fi
zip -r $artifactName $sourceDir
