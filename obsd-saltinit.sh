#!/bin/sh
pkg_add salt
#cp /vagrant/salt/key/master.pub /etc/salt/pki/minion/minion_master.pub
#cp /vagrant/salt/key/minion.* /etc/salt/pki/minion/
mkdir -p -m 700 /etc/salt/pki/minion/
cp /vagrant/master.pub /etc/salt/pki/minion/minion_master.pub
cp /vagrant/minion.* /etc/salt/pki/minion/
echo 'pkg_scripts="salt_minion"' > /etc/rc.conf.local
perl -pi -e 's/^master: 127.0.0.1/#master: 127.0.0.1/g;' /etc/salt/minion
/etc/rc.d/salt_minion start
