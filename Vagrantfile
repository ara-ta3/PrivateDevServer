# -*- mode: ruby -*-
# vi: set ft=ruby :

$yum_install_script = <<SCRIPT
rpm -ivh http://ftp-srv2.kddilabs.jp/Linux/distributions/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm -ivh http://dl.iuscommunity.org/pub/ius/stable/Redhat/6/x86_64/ius-release-1.0-11.ius.el6.noarch.rpm
yum update
yum install -y openssl zsh vim git
yum install -y mysql-server mysql mysql-devel
yum install -y php54-cli php54-pdo php54-mysql php54-common php54 php54-cgi php54-fpm php54-devel php54-gd php54-mbstring php54-odbc php54-pear php54-snmp php54-bcmath php54-xmlrpc php54-tidy php54-xml php54-mssql php54-soap php54-pgsql
yum install -y httpd
usermod -s /bin/zsh vagrant
service httpd restart
service mysqld restart
service iptables stop
SCRIPT

$dev_local_files = <<SCRIPT
git clone https://github.com/tarata/dotfiles.git $HOME/dotfiles
rm -f $HOME/.vimrc
rm -rf $HOME/.vim
rm -f $HOME/.zshrc
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/.vim $HOME/.vim
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
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
