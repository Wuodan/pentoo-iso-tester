#!/bin/bash

# script to find user name in a pentoo-installer config file
# input is json from stdin
# output is the user name or 'pentoo' if it's not set in the config file
# example usage:
# cat config-file.json | ./find-username.sh
# example output:
# vagrant

set -eu

# read username from config file
USERNAME="$(jq -j '.username')"
# if not set use default=pentoo
if [[ "${USERNAME}" == 'null' ]]; then
    USERNAME='pentoo'
fi
printf '%s' "${USERNAME}"
