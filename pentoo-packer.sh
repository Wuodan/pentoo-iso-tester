#!/bin/bash

set -e

if [ -z "$1" ]; then
	printf "Supply http URL to iso. Example:\n" 2>&1
	printf "\t./$(basename "$0") http://mirror.switch.ch/ftp/mirror/pentoo/Pentoo_amd64_hardened/pentoo-amd64-hardened-2018.0_RC8.iso\n" 2>&1
	printf "The script will use the sha512 hash from the digests file.\n" 2>&1
	exit 1
fi

URL="$1"

ISO="$(basename "${URL}")"
SHA512="$(curl -s "${URL}".DIGESTS | grep -A1 '^# SHA512' | grep '\.iso$' | grep -Eo '^[^ ]+')"

printf "Using iso: ${ISO}\n"
printf "With SHA512: ${SHA512}\n"

sed -e "s#URL#${URL}#g" -e "s#SHA512#${SHA512}#g" pentoo.json | \
	PACKER_LOG=1 PACKER_LOG_PATH="$(dirname ${0})/packer.log" packer build -on-error=ask -
