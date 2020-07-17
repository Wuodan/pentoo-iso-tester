#!/bin/bash

# script to place Vagrants public ssh key into the box for 'vagrant up'
# example usage:
# ./setup-vagrant.sh config-file.json

set -eu

DESTDIR="${1}"

chroot "${DESTDIR}" sudo rc-update add NetworkManager default
chroot "${DESTDIR}" sudo rc-update add sshd default
