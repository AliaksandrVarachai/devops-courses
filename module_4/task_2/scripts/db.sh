rootDir=$(readlink -f "..")
dataDir=$rootDir/data
usersDbPath=$dataDir/users.db

command=$1
optionalParam=$2

function validateLatinLetters {
  if [[ $1 =~ ^[A-Za-z_]+$ ]]
  then return 0
  else return 1
  fi
}

function add {
  read -p "Username: " username
  validateLatinLetters $username
  if [[ $? == 1 ]]; then
    echo "Username must have only latin chars"
    exit 1
  fi

  read -p "Role: " role
  validateLatinLetters $role
  if [[ $? == 1 ]]; then
    echo "Role must have only latin chars"
    exit 1
  fi

  echo "$username,$role" >> $usersDbPath
  echo "$username,$role is saved"
}

function backup {
  local backupFileName=$(date +'%Y-%m-%d-%H-%M-%S')-users.db.backup
  cp $usersDbPath $dataDir/$backupFileName
  echo "Backup is created"
}

function restore {
  local latestBackupFile=$(ls $dataDir/*.backup | tail -n 1)

  if [[ ! -f $latestBackupFile ]]; then
    echo "Backup file not found"
    exit 1
  fi

  cat $latestBackupFile > $usersDbPath
  echo "Backup is restored from $latestBackupFile"
}

function find {
  read -p "Username to search: " username
  local searchResults=$(grep -i $username $usersDbPath)

  if [ -z "$searchResults" ]; then
    echo "User is not found"
  else
    echo "$searchResults"
  fi
}

function list {
  if [[ $optionalParam == "inverse" ]]; then
    cat -n $usersDbPath | tac
  else
    cat -n $usersDbPath
  fi
}

function help {
  echo "Manages users in a database"
  echo "Syntax: db.sh [command] [optionalParam]"
  echo "List of available commands:"
  echo "  add      Adds a user to DB"
  echo "  backup   Create a backup of users' DB"
  echo "  find     Finds a user info in DB"
  echo "  list     Displays the full list of users. If [optionalParam=reverse], in reverse order"
}

case "$command" in
  add) add ;;
  backup) backup ;;
  restore) restore ;;
  find) find ;;
  list) list ;;
  help | *) help ;;
esac
