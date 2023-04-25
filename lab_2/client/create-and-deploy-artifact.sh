#!/usr/bin/env bash

# Runs in client repository on LOCAL machine

# variables
artifactName=client-artifact.zip
artifactScriptName=client-artifact.sh
remoteServerAlias=vb-ubuntu
destinationRepo=/home/sshuser/projects

# creates artifact
if [ -e $artifactName ]; then
  rm $artifactName
fi
# TODO: load from GIT master
zip -r $artifactName \
  .serverless_plugins \
  public \
  src \
  .eslint* \
  index.html \
  package*.json \
  README.md \
  serverless.yml \
  tsconfig*.json \
  vite.config.ts

# copies artifact to remote server
scp $artifactName $artifactScriptName $remoteServerAlias:$destinationRepo

rm $artifactName

