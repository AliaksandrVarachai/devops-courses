# Module 4: 

## Task 1.1

```bash
./watch-free-disk-space.sh --threshold=10
# prints
# Disk Free space:
#  used       8.3Gi
#  available   67Gi
#  capacity     12%
# Warn: threshold 10% is exceeded. Please free space

./watch-free-disk-space.sh
# prints
# Disk Free space:
#   used       8.3Gi
#   available   67Gi
#   capacity     12%
# Info: threshold 90% is not exceeded
```

## Task 1.2

```bash
./count-files-recursively.sh dir1 dir2
# prints
# Files found in directories (recursively):
#     dir1                5 file(s)
#     dir2                2 file(s)
# TOTAL: 11 file(s)
```
