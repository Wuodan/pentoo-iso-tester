# Auto-test Pentoo iso
These are setup files to automatically test Pentoo ISOs.

All you have to run is:
* ./pentoo-packer.sh [url-to-iso]
* vagrant up

What the above 2 commands do is:
1. Download ISO
1. Boot from ISO
1. Update
1. Install Pentoo (headless, no user interaction)
1. Boot from disk to installed Pentoo

These build steps are performed in parallel for each target VM.
Target VMs may differ in cpu, ram, disk layout, etc.

## Requirements
- Virtualbox: app-emulation/virtualbox
- Packer: dev-util/packer 
- Vagrant: app-emulation/vagrant
- Temporarily about 40 GB of disk space for 3 parallel builds

## Config
The pentoo.json config file contains setups with different RAM/CPU settings which will be built in parallel.

Disk layout is taken from one of the sample config files in the pentoo-installer:

https://github.com/pentoo/pentoo-installer/blob/master/share/pentoo-installer/config-samples/config.bios.msdos.json

## Debugging
Log is written to ./packer.log

Packer builds with -on-error=ask, leaving the VM open for inspection if anything goes wrong.

## ToDo
* Uefi: Can't boot anything by UEFI with packer/vagrant/vbox. This was in 2018, have to retry.
