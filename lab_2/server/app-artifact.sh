#!/usr/bin/env bash

# Runs on REMOTE virtual machine

# variables
artifactPath=~/projects/app-artifact.zip
projectPath=/var/app
appName=nestjs-rest-api
ecosystemConfigPath=ecosystem.config.js

if [ -e $projectPath ]; then
  rm -r -f $projectPath
fi

mkdir $projectPath
cd $projectPath
unzip $artifactPath
# rm $artifactPath

. ~/.nvm/nvm.sh
nvm use 16
npm ci
npm run build

pm2 delete $appName
pm2 start $ecosystemConfigPath
