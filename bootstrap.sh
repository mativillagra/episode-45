#!/usr/bin/env bash

sudo rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm

yum install puppet-3.8.2 -y

adduser provision

touch /etc/sudoers.d/provision

cat >> /etc/sudoers.d/provision <<EOL

%provision ALL=NOPASSWD:/usr/bin/puppet
Defaults env_keep += FACTER_*

EOL
