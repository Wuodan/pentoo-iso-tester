#!/bin/bash

# script to run pentoo-installer in the packer box
# example usage:
# ./install-pentoo.sh config-file.json

set -eu

CONFIG_FILE="${1}"

# TODO: remove next line once https://github.com/pentoo/pentoo-livecd/issues/37 is fixed
sudo chown root:portage /var/cache/distfiles && sudo chmod g+w /var/cache/distfiles

sudo rc-update add NetworkManager default
sudo rc-update add sshd default

sudo sh -c "echo 'GENTOO_MIRRORS=\"http://mirror.netcologne.de/gentoo/ http://linux.rz.ruhr-uni-bochum.de/download/gentoo-mirror/ http://ftp-stud.hs-esslingen.de/pub/Mirrors/gentoo/\"' >> /etc/portage/make.conf"

# setup wuodan repository
sudo emerge -1 app-eselect/eselect-repository
sudo eselect repository add wuodan git https://github.com/Wuodan/gentoo-overlay.git
sudo emerge --sync wuodan
sudo mkdir -p /etc/portage/package.mask
sudo sh -c 'echo */*::wuodan >> /etc/portage/package.mask/overlays'
sudo mkdir -p /etc/portage/package.unmask
sudo sh -c 'echo pentoo/pentoo-installer::wuodan >> /etc/portage/package.unmask/overlays'
sudo ACCEPT_KEYWORDS='**' emerge -1 '=pentoo/pentoo-installer-99999999::wuodan'

# run installer
sudo pentoo-installer --headless --config-file "${CONFIG_FILE}"
