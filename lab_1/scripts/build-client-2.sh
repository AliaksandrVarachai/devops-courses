#!/usr/bin/env bash

# example
# ./build-client-2.sh

sourceDir=dist
artifactName=artifact.zip

npm install

npm run build



# builds artifact
if [ -e $artifactName ]; then
  rm $artifactName
fi
zip -r $artifactName $sourceDir
