#!/usr/bin/env bash

commands=(
  'docker build -t <image_name>'
  'docker build -t <image_name> . –no-cache'
  'docker images'
  'docker rmi <image_name>'
  'docker image prune'
  'docker -d'
  'docker run --name <container_name> <image_name>'
  'docker run -p <host_port>:<container_port> <image_name>'
  'docker run -d <image_name>'
  'docker start|stop <container_name_or_id>'
  'docker rm <container_name>'
  'docker exec -it <container_name> sh'
  'docker logs -f <container_name>'
  'docker inspect <container_name_or_id>'
  'docker ps'
  'docker ps --all'
  'docker container stats'
)

printAllCommands() {
  local regex=$1
  old_IFS=$IFS
  IFS=$'\n'
  local isFirstLinePrinted=false
  for command in "${commands[@]}"; do
    if [[ "$command" =~ $regex ]]; then
      if [ ! isFirstLinePrinted ]; then
        isFirstLinePrinted=true
        echo
      fi
      echo $command
    fi
  done
  IFS=old_IFS
}

printSuggestions() {
  local isEmptySuggestions=true
  for i in ${!suggestions[@]}; do
    if [ $i -eq 0 ]; then
      echo;
      fi
    printf "%2d. %s\n" $i ${suggestions[$i]}
  done
  COMPREPLY=("${suggestions[@]}")
}

_dockCompletions() {
  regexp="^${COMP_WORDS[@]}"

  old_IFS=$IFS
  IFS=$'\n'
  if [[ ${#COMP_WORDS[@]} -eq 2 && -z ${COMP_WORDS[1]} ]]; then
    suggestions=("${commands[@]}")
    printSuggestions
  else
    suggestions=($(compgen -W "$(printAllCommands "$regexp")"))
    printSuggestions
  fi
  IFS=$old_IFS
}

complete -F _dockCompletions docker
