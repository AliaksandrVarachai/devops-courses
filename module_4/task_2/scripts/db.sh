rootDir=$(readlink -f "..")
dataDir=$rootDir/data
usersDbPath=$dataDir/users.db



# db.sh | db.sh help => must check users.db existence

# prints instructions how to use commands add, backup, find, list, help

# creates a new file %date%-users.db.backup.db

# Takes the last created backup (or "no backup file found")
# db.sh find

# Prompts
#echo `dirname "$(readlink -f "$BASH_SOURCE")"`

commandErrorMessage="Invalid command $*. Use '$0 help' for assistance"
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
}

case "$command" in
  add) add ;;
  backup) backup ;;
  restore) restore ;;
  find) find ;;
  list) list ;;
  help | *) echo help ;;
esac






