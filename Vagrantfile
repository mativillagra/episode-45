# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

    # create mgmt node
    config.vm.define :mgmt do |mgmt_config|
        mgmt_config.vm.box = "precise32"
        mgmt_config.vm.box_url = "http://hashicorp-files.vagrantup.com/precise32.box"
        mgmt_config.vm.hostname = "mgmt"
        mgmt_config.vm.network :private_network, ip: "10.0.15.12"  
        mgmt_config.vm.provider "virtualbox" do |vb|
              vb.memory = "256"
          end
        mgmt_config.vm.provision :shell, path: "bootstrap-mgmt.sh"
    end


  # create load balancer
  config.vm.define :lb do |lb_config|
      lb_config.vm.box = "precise32"
      lb_config.vm.box_url = "http://hashicorp-files.vagrantup.com/precise32.box"
      lb_config.vm.hostname = "lb"
      lb_config.vm.network :private_network, ip: "10.0.15.14"
      lb_config.vm.network "forwarded_port", guest: 80, host: 8082
      lb_config.vm.provider "virtualbox" do |vb|
        vb.memory = "256"
      end
  end

end
