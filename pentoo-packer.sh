#!/bin/bash

set -e

if [ -z "$1" ]; then
	printf "Supply http URL to iso. Example:\n" 2>&1
	printf "\t./$(basename "$0") http://mirror.switch.ch/ftp/mirror/pentoo/Pentoo_amd64_hardened/pentoo-amd64-hardened-2018.0_RC8.iso\n" 2>&1
	printf "The script will use the sha512 hash from the digests file.\n" 2>&1
	exit 1
elif [ "$(whoami)" != "root" ] && ! groups | grep -qw vboxusers; then
	printf "The user running this must be in group 'vboxusers' or must be user 'root'\n"
	exit 1
elif ! which packer &>/dev/null; then
	printf "dev-util/packer is not installed\n"
	MISSINGDEPS=1
elif ! which vagrant &>/dev/null; then
	printf "app-emulation/vagrant is not installed\n"
	MISSINGDEPS=1
elif ! which VBoxManage &>/dev/null; then
	printf "app-emulation/virtualbox is not installed\n"
	MISSINGDEPS=1
fi

if [ "${MISSINGDEPS}" = "1" ]; then
	printf "Hint:\n"
	printf "This project has a folder package.accept_keywords. Refer to it for portage configuration.\n"
	printf "Then run:\n"
	printf "'emerge -avt app-emulation/virtualbox dev-util/packer app-emulation/vagrant'\n"
	exit 1
fi

URL="$1"
ISO="$(basename "${URL}")"
BLAKE2="$(curl -s "${URL}".DIGESTS | grep -A1 '^# BLAKE2' | grep '\.iso$' | grep -Eo '^[^ ]+')"

printf "Using iso: ${ISO}\n"
printf "With BLAKE2 hash: ${BLAKE2}\n"

sed -e "s#URL#${URL}#g" -e "s#BLAKE2#${BLAKE2}#g" pentoo.json | \
	PACKER_LOG=1 PACKER_LOG_PATH="$(dirname ${0})/packer.log" packer build -on-error=ask -
