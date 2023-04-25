#!/usr/bin/env bash

# Runs in server repository on LOCAL machine

# variables
artifactName=app-artifact.zip
artifactScriptName=app-artifact.sh
remoteServerAlias=vb-ubuntu
destinationRepo=/home/sshuser/projects

# creates artifact
if [ -e $artifactName ]; then
  rm $artifactName
fi
# TODO: load from GIT master
zip -r $artifactName \
  src \
  .eslintrc.js \
  .prettierrc \
  ecosystem.config.js \
  LICENSE \
  nest-cli.json \
  package*.json \
  README.md \
  tsconfig*.json

# copies artifact to remote server
scp $artifactName $artifactScriptName $remoteServerAlias:$destinationRepo

rm $artifactName
