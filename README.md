# Auto-install Pentoo
These are setup files to auto-install Pentoo into severeal vbox VMs.

All you have to run is:
* ./pentoo-packer.sh [url-to-iso]
* vagrant up

_(vagrant up has to be run several times somehow, help is welcome!)_

What the above 2 commands do is:
1. Download ISO
1. Boot from ISO
1. Update
1. Install Pentoo (headless, no user interaction)
1. Boot from disk to installed Pentoo

These build steps are performed in parallel for each target VM.
Target VMs may differ in cpu, ram, iso, etc.

## Requirements
- Virtualbox: app-emulation/virtualbox
- Packer: app-emulation/packer 
- Vagrant: app-emulation/vagrant
- Temporarily about 40 GB of disk space for 3 parallel builds

## Config
The pentoo.json config file contains 2 setups with different RAM/CPU settings which will be built in parallel.
Disk layout is according to one of the sample config files in the pentoo-installer:
https://github.com/Wuodan/pentoo-installer/blob/config-file/config-samples/config.bios.msdos.json

## ToDo
* Uefi: Can't boot anything by UEFI with packer/vagrant/vbox. It just shows the efi-shell, please help
* Vagrant SSH: 'vagrant up' can't connect by ssh, but ssh is working in all other cases, even by vagrant.
