# -*- mode: ruby -*-
# vi: set ft=ruby :

$yum_install_script = <<SCRIPT
sh /vagrant/scripts/common-install.sh
sh /vagrant/scripts/elastic-search-install.sh
SCRIPT

$dev_local_files = <<SCRIPT
sh /vagrant/scripts/dev-local-files.sh
SCRIPT


Vagrant.configure("2") do |config|
    config.vm.hostname = "PrivateDevServer-berkshelf"
    config.vm.box = "centos"

    config.vm.network :private_network, ip: "192.168.56.110"
    config.vm.provider :virtualbox do |vb|
        vb.gui = false
        vb.customize ["modifyvm", :id, "--memory", "1024"]
    end

    config.vm.provision "shell",inline: $yum_install_script
    config.vm.provision "shell",inline: $dev_local_files,privileged: false
end
