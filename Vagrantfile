Vagrant.configure("2") do |config|

  config.vm.define "bios" do |bios|
    bios.vm.box = "packer_pentoo-vbox-bios_virtualbox.box"
    bios.vm.hostname = 'bios'
  end

  config.vm.define "biosminimal" do |biosminimal|
    biosminimal.vm.box = "packer_pentoo-vbox-bios-minimal_virtualbox.box"
    biosminimal.vm.hostname = 'biosminimal'
  end

  config.vm.define "bios20180730" do |bios20180730|
    bios20180730.vm.box = "packer_pentoo-vbox-bios-RC7.2_p20180730_virtualbox.box"
    bios20180730.vm.hostname = 'bios20180730'
  end

  config.ssh.username = "pentoo"
  config.ssh.password = "pentoo"
  config.ssh.insert_key = false
  config.ssh.private_key_path = "~/.vagrant.d/insecure_private_key"

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    # vb.cpus = "2"
    # vb.firmware = "bios"
    vb.gui = true
    # vb.memory = "4096"
  end

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
