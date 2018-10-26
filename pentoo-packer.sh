#!/bin/bash

set -e

usage(){
	echo "TODO"
}

parse_input(){
	
	echo "TODO"
	return 0
}

parse_input "${@}" || (
	usage
	exit 1
)


# curl -ls ftp://mirror.switch.ch/mirror/pentoo/Beta/Pentoo_amd64_hardened/ | grep '.iso$' | tail -n1

PACKER_LOG=1 PACKER_LOG_PATH="$(dirname ${0})/packer.log" packer build -on-error=ask pentoo.json
