#!/usr/bin/env bash

# Example #1:
# ./watch-free-disk-space.sh --threshold=10
# returns
# Disk Free space:
#  used       8.3Gi
#  available   67Gi
#  capacity     12%
# Warn: threshold 10% is exceeded. Please free space

# Example #2:
# ./watch-free-disk-space.sh
# returns
# Disk Free space:
#   used       8.3Gi
#   available   67Gi
#   capacity     12%
# Info: threshold 90% is not exceeded


defaultUsedThreshold=90; # %

usedThreshold=$defaultUsedThreshold;

### Checking of arguments
for i in "$@"; do
    case $i in
        -t=*|--threshold=*)
            usedThreshold="${i#*=}"
            shift # past argument=value
        ;;
        -*|--*)
            echo "Unknown option $i"
            exit 1
            ;;
        *)
            echo "Unknown option $i"
            ;;
    esac
done

read -a dfArray <<< $(df -h / | awk 'NR==2 {print $3, $4, $5}')

usedSpace=${dfArray[0]}       # string like 8.3Gi
availableSpace=${dfArray[1]}  # string like 67Gi
capacity=${dfArray[2]/\%/}    # number (without %)

echo "Disk Free space:"
printf "  %-9s %6s\n  %-9s %6s\n  %-9s %5s%%\n" "used" $usedSpace "available" $availableSpace "capacity" $capacity

if [ $capacity -gt $usedThreshold ]
then
  echo "Warn: threshold $usedThreshold% is exceeded. Please free space"
else
  echo "Info: threshold $usedThreshold% is not exceeded"
fi
