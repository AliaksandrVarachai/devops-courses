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

npm install
# answers "no" for request of using stats
yes n | ng build --configuration=$ENV_CONFIGURATION


# builds artifact
if [ -e $artifactName ]; then
  rm $artifactName
fi
zip -r $artifactName $sourceDir
