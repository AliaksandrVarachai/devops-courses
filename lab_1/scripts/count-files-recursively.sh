#!/usr/bin/env bash

# Example
# count-files-recursively dir1 dir2
# prints
# Files found in directories (recursively):
#     dir1                5 file(s)
#     dir2                2 file(s)
# TOTAL: 7 file(s)

function countFilesRecursively {
  define -i totalFiles=0
  echo "Files found in directories (recursively):"
  for dirName in "$@"
  do
    if [ -d $dirName ]; then
      filesNumber=$(find $dirName -type f | wc -l)
      (( totalFiles+=filesNumber ))
      printf "    %-16s %4d file(s)\n" $dirName $filesNumber
    else
      printf "    %-16s is not found\n" $dirName
    fi
  done
  echo "TOTAL: $totalFiles file(s)"
}

