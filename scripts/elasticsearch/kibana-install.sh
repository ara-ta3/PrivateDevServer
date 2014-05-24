cd /tmp

if [ -e kibana-3.0.0milestone5.tar.gz ]; then
    echo "file was already downloaded"
else
    wget https://download.elasticsearch.org/kibana/kibana/kibana-3.0.0milestone5.tar.gz
    tar zxf kibana-3.0.0milestone5.tar.gz
fi

if [ -e /opt/kibana ]; then
    echo "kibana was already installed"
else
    mv -f /tmp/kibana-3.0.0milestone5 /opt/kibana
    cat /vagrant/scripts/elasticsearch/kibana-config.js > /opt/kibana/config.js
fi

