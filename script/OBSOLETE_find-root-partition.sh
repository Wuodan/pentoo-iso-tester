#!/bin/bash

# script to find root partition in a pentoo-installer config file
# input is json from stdin
# output is the root partition
# example usage:
# < config-file.json ./find-root-partition.sh
# example output:
# /dev/sda3

set -eu

# entire json object with root disk
ROOT_DISK="$(jq '.disks[] | select(.partitions[] | select(.mountpoint == "/"))')"
# root disk (/dev/sda)
printf '%s\n' "${ROOT_DISK}" | jq -j '.device'
# root partition index number in root disk (3)
printf '%s\n' "${ROOT_DISK}" | jq -j '.partitions | map(.mountpoint == "/") | index(true) + 1'
