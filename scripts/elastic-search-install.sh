#
# see also http://blog.excale.net/index.php/archives/1929
cd /tmp
if [ -e elasticsearch-1.0.1.tar.gz ]; then
    echo "file was already downloaded"
else
    wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.0.1.tar.gz
    tar xf elasticsearch-1.0.1.tar.gz
fi

if [ -e /opt/elasticsearch ]; then
    echo "elasticsearch was already installed"
else
    mv -f /tmp/elasticsearch-1.0.1 /opt/elasticsearch
    cat /vagrant/scripts/elasticsearch/config.yml >> /opt/elasticsearch/config/elasticsearch.yml
fi
/opt/elasticsearch/bin/elasticsearch -d
