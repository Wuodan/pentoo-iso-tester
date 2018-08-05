# pentoo-packer
These are setup files to auto-install Pentoo into severeal vbox VMs.
All you have to run is:
* packer build pentoo.json
* vagrant up

_(vagrant up has to be run 3 times somehow, help is welcome!)_

What the above 2 commands do is:
1. Download ISO
1. Boot from ISO
1. Update
1. Install Pentoo (headless, no user interaction)
1. Boot from disk to installed Pentoo

These build steps are performed in parallel for each target VM.
Target VMs may differ in cpu, ram, iso, etc.

## Requirements
- Virtualbox
- Packer
- Vagrant
- Temporarily about 40 GB of disk space for 3 parallel builds

## Useage detail
Clone the repo, cd to the folder and run:

`sudo packer build pentoo.json`

`sudo vagrant up;
sudo vagrant up;
sudo vagrant up`

## Debugging

to debug the pentoo-installer, run:

`sudo PACKER_LOG=1 packer build -on-error=ask pentoo.json 2>&1 | tee ~/packer-pentoo.log`
