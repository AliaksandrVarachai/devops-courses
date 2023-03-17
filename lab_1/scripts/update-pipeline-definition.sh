#!/usr/bin/env bash

defaultPipelineName="pipeline"
defaultBranchName="develop"

# colors
red=$'\e[1;31m';
grn=$'\e[1;32m';
end=$'\e[0m';

function checkJQ {
  type jq > /dev/null 2>&1
  exitCode=$?

  if [ $exitCode -eq 0 ]; then
    echo "${grn}'jq' is found!${end}"
  else
    echo "${red}'jq' is not found. Please install it first${end}"
  fi
}

checkJQ

read -p "Enter a code pipeline name [$defaultPipelineName]: " pipelineName
pipeline=${pipelineName:-$defaultPipelineName}

read -p "Enter a source branch name [$defaultBranchName]: " branchName
branchName=${branchName:-$defaultBranchName}

echo $pipeline



# builds artifact
#if [ -e $artifactName ]; then
#  rm $artifactName
#fi
#zip -r $artifactName $sourceDir
