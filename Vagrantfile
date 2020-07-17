Vagrant.configure("2") do |config|

  config.vm.define "efi" do |efi|
    efi.vm.box = "packer_pentoo-vbox-efi.box"
    efi.vm.hostname = 'efi'
  end

  # config.vm.network "private_network", type: "dhcp"
  config.vm.network "private_network", ip: "192.168.33.10"

  # config.ssh.insert_key = true
  # config.ssh.private_key_path = "~/.vagrant.d/insecure_private_key"

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    # vb.cpus = "2"
    # vb.firmware = "efi"
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
