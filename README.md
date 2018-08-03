# pentoo-packer
Create a VirtualBox VM with Pentoo installed using packer and vagrant

## Requirements
- Virtualbox
- Packer
- Vagrant

## Useage
Clone the repo, cd to the folder and run:

`sudo packer build pentoo.json`

`vagrant up`

to debug the pentoo-installer, I run:

`sudo PACKER_LOG=1 packer build -on-error=ask pentoo.json`

and

`ssh ssh://pentoo@127.0.0.1:3618`

to ssh into the box during the installation.
