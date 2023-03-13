#!/usr/bin/env bash

# Example
# ./count-files-recursively.sh dir1 dir2
# prints
# Files found in directories (recursively):
#     dir1                5 file(s)
#     dir2                2 file(s)
# TOTAL: 11 file(s)

define -i totalFiles=0
echo "Files found in directories (recursively):"
for dirName in "$@"
do
  filesNumber=$(find $dirName -type f | wc -l)
  totalFiles+=1
  printf "    %-16s %4d file(s)\n" $dirName $filesNumber
done
echo "TOTAL: $totalFiles file(s)"
