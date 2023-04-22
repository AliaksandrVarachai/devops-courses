#!/usr/bin/env bash

defaultPipelinePath="./pipeline.json"
defaultBranchName="main"
defaultOwner="aliaksandrvarachai"
defaultRepo="shop-angular-cloudfront"
defaultPollForSourceChanges=false
defaultEnvironmentVariables="[{\"name\":\"BUILD_CONFIGURATION\",\"value\":\"{{BUILD_CONFIGURATION value}}\",\"type\":\"PLAINTEXT\"}]"

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

read -p "Enter a code pipeline path [$defaultPipelinePath]: " pipelinePath
pipelinePath=${pipelinePath:-$defaultPipelinePath}

if [ ! -e $pipelinePath ]; then
  echo "${red}Pipeline file '$pipelinePath' is no found${end}"
  exit 1
fi

read -p "Enter a source branch name [$defaultBranchName]: " branchName
branchName=${branchName:-$defaultBranchName}

read -p "Enter owner name [$defaultOwner]: " owner
owner=${owner:-$defaultOwner}

read -p "Enter repository name [$defaultRepo]: " repo
repo=${repo:-$defaultRepo}

read -p "Enter PollForSourceChanges property [$defaultPollForSourceChanges]: " pollForSourceChanges
pollForSourceChanges=${pollForSourceChanges:-$defaultPollForSourceChanges}

prettifiedJSON=

read -p "Enter EnvironmentVariables property[$defaultEnvironmentVariables]: " environmentVariables
environmentVariables=${environmentVariables:-defaultEnvironmentVariables}

tempPipelineName="pipeline.$(date +'%Y-%m-%dT%T').json";

# Removes metadata
# Increments version
# Sets Branch, Owner, Repo, PollForSourceChanges, EnvironmentVariables
jq \
--arg branchName "$branchName" \
--arg owner "$owner" \
--arg repo "$repo" \
--arg pollForSourceChanges "$pollForSourceChanges" \
--arg environmentVariables "$environmentVariables" \
'del(.metadata)
| .pipeline.version += 1
| .pipeline.stages[].actions[].configuration.Branch = $branchName
| .pipeline.stages[].actions[].configuration.Owner = $owner
| .pipeline.stages[].actions[].configuration.Repo = $repo
| .pipeline.stages[].actions[].configuration.PollForSourceChanges = $pollForSourceChanges
| .pipeline.stages[1].actions[0].configuration.EnvironmentVariables = $environmentVariables
' \
"$pipelinePath" > "$tempPipelineName"

echo "${grn}New pipeline is saved to '$tempPipelineName'${end}"
