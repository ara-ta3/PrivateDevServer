rpm -ivh http://ftp-srv2.kddilabs.jp/Linux/distributions/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm -ivh http://dl.iuscommunity.org/pub/ius/stable/Redhat/6/x86_64/ius-release-1.0-11.ius.el6.noarch.rpm
yum update
yum install -y openssl zsh vim git
which mysql

if test $? -ne 1
then
    yum install -y mysql-server mysql mysql-devel
fi

which java
if test $? -ne 1
then
    yum install -y java-1.7.0
fi

which php
yum install -y php54-cli php54-pdo php54-mysql php54-common php54 php54-cgi php54-fpm php54-devel php54-gd php54-mbstring php54-odbc php54-pear php54-snmp php54-bcmath php54-xmlrpc php54-tidy php54-xml php54-mssql php54-soap php54-pgsql

yum install -y httpd
cd /tmp;
if [ -e Gauche-0.9.3.3.tgz ]; then
    echo ""
else
    wget http://prdownloads.sourceforge.net/gauche/Gauche-0.9.3.3.tgz;
    tar xf Gauche-0.9.3.3.tgz
fi

which gosh
if test $? -ne 1
then
    cd Gauche-0.9.3.3;./configure;make;make install;
fi

cp -f /vagrant/config/httpd/httpd-vhosts.conf /etc/httpd/conf.d/
usermod -s /bin/zsh vagrant
service httpd restart
service mysqld restart
service iptables stop
