# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.hostname = "PrivateDevServer-berkshelf"
    config.vm.box = "centos"

    config.vm.network :private_network, ip: "192.168.56.110"
    config.vm.provider :virtualbox do |vb|
        vb.gui = false
        vb.customize ["modifyvm", :id, "--memory", "1024"]
    end
    config.omnibus.chef_version = :latest
    config.berkshelf.enabled = true

    config.ssh.max_tries = 40
    config.ssh.timeout   = 120

    config.vm.provision :chef_solo do |chef|
        chef.cookbooks_path = ["./cookbooks", "./site-cookbooks"]
        chef.add_recipe "yum::epel"
        chef.add_recipe "yum::remi"
        chef.add_recipe "zsh"
        chef.add_recipe "php"
        chef.add_recipe "apache2"
        chef.add_recipe "apache2::mod_php5"
        chef.add_recipe "vim"

        chef.run_list = [
            "vim",
            "php",
            "apache2",
            "apache2::mod_php5",
            "zsh",
            "mysql::server",
            "mysql::client"
        ]

        chef.json = {
            :apache => {
                :default_site_enabled => true
            },
            mysql: {
                server_root_password: "sqlpass",
                server_repl_password: "sqlpass",
                server_debian_password: "sqlpass",
                bind_address: "127.0.0.1"
            }
        }
    end
end
