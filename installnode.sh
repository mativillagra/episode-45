#!/usr/bin/env bash

rpm -Uvh http://repos.mesosphere.com/el/7/noarch/RPMS/mesosphere-el-repo-7-1.noarch.rpm
yum -y install mesos device-mapper-event-libs docker

# point this node at the mesos master
sed -i -e 's/localhost/10.0.15.16/g' /etc/mesos/zk
echo 'docker,mesos' | sudo tee /etc/mesos-slave/containerizers

service mesos-slave start
chkconfig mesos-slave on
chkconfig mesos-master off

chkconfig docker on
service docker start

# configure hosts file for our internal network defined by Vagrantfile
cat >> /etc/hosts <<EOL

10.0.15.16 ce
10.0.15.20 node1
EOL
