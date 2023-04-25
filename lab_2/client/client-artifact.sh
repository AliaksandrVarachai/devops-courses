#!/usr/bin/env bash

# Runs on REMOTE virtual machine

# variables
artifactPath=~/projects/client-artifact.zip
projectPath=~/projects/shop-react-redux-cloudfront
publicPath=/var/www/shop

if [ -e $projectPath ]; then
  rm -r -f $projectPath
fi

mkdir $projectPath
cd $projectPath
unzip $artifactPath
# rm $artifactPath

. ~/.nvm/nvm.sh
nvm use 16
npm ci --legacy-peer-deps
npm run build

rm -r -f $publicPath
mkdir -p $publicPath
cp -r dist/* -d $publicPath
