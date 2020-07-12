#!/bin/bash

# script to place Vagrants public ssh key into the box for 'vagrant up'
# example usage:
# ./setup-vagrant.sh config-file.json

set -eu

CONFIG_FILE="${1}"

# directory of this script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
# root partition of the pentoo installation in the config file
ROOT_PARTITION="$(cat "${CONFIG_FILE}" | "${DIR}"/find-root-partition.sh)"
# user name of the pentoo installation (default=pentoo)
USERNAME="$(cat "${CONFIG_FILE}" | "${DIR}"/find-username.sh)"
# target file for Vagrants insecure public key
FILE_AUTH_KEYS="/home/${USERNAME}/.ssh/authorized_keys"

# mount root partition and add Vagrant insecure public key
sudo mkdir -p /mnt/gentoo
sudo mount "${ROOT_PARTITION}" /mnt/gentoo

# download insecure vagrant public key to ~/.ssh/authorized_keys
sudo chroot /mnt/gentoo wget https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub -O "${FILE_AUTH_KEYS}"
# set permissions and ownership
sudo chroot /mnt/gentoo chmod 600 "${FILE_AUTH_KEYS}"
sudo chroot /mnt/gentoo chown "${USERNAME}":users "${FILE_AUTH_KEYS}"
