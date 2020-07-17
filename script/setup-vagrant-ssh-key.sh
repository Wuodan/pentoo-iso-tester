#!/bin/bash

# script to place Vagrants public ssh key into the box for 'vagrant up'
# example usage:
# ./setup-vagrant.sh config-file.json

set -eu

DESTDIR="${1}"
INSTALLER_CONFIGFILE="${2}"

# directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# user name of the pentoo installation (default=pentoo)
USERNAME="$(< "${INSTALLER_CONFIGFILE}" "${DIR}"/find-username.sh)"

# target file for Vagrants insecure public key
FILE_AUTH_KEYS="/home/${USERNAME}/.ssh/authorized_keys"

# download insecure vagrant public key to ~/.ssh/authorized_keys
chroot "${DESTDIR}" wget https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub -O "${FILE_AUTH_KEYS}"
# set permissions and ownership
chroot "${DESTDIR}" chmod 600 "${FILE_AUTH_KEYS}"
chroot "${DESTDIR}" chown "${USERNAME}":users "${FILE_AUTH_KEYS}"
