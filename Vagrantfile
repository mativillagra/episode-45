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

 # create ce node
    config.vm.define :ce do |ce_config|
        ce_config.vm.box = "centos7"
        ce_config.vm.box_url = "http://cloud.centos.org/centos/7/vagrant/x86_64/images/CentOS-7.box"
        ce_config.vm.hostname = "ce"
        ce_config.vm.network :private_network, ip: "10.0.15.16"
        ce_config.vm.provider "virtualbox" do |vb|
              vb.memory = "1024"
          end
        ce_config.vm.provision :shell, path: "bootstrap-ce.sh"
    end

 # create node1 node
    config.vm.define :node1 do |node1_config|
        node1_config.vm.box = "centos7"
        node1_config.vm.box_url = "http://cloud.centos.org/centos/7/vagrant/x86_64/images/CentOS-7.box"
        node1_config.vm.hostname = "node1"
        node1_config.vm.network :private_network, ip: "10.0.15.20"
        node1_config.vm.provider "virtualbox" do |vb|
              vb.memory = "1024"
          end
        node1_config.vm.provision :shell, path: "installnode.sh"
    end

 # create master node
    config.vm.define :master do |master_config|
        master_config.vm.box = "centos7"
        master_config.vm.box_url = "http://cloud.centos.org/centos/7/vagrant/x86_64/images/CentOS-7.box"
        master_config.vm.hostname = "master"
        master_config.vm.network :private_network, ip: "10.0.15.10"
        master_config.vm.provider "virtualbox" do |vb|
              vb.memory = "512"
          end
        master_config.vm.provision :shell, path: "bootstrap-master.sh"
    end

 # create pacman node
    config.vm.define :pacman do |pacman_config|
        pacman_config.vm.box = "centos7"
        pacman_config.vm.box_url = "http://cloud.centos.org/centos/7/vagrant/x86_64/images/CentOS-7.box"
        pacman_config.vm.hostname = "pacman"
        pacman_config.vm.network :private_network, ip: "10.0.15.18"
        pacman_config.vm.provider "virtualbox" do |vb|
              vb.memory = "512"
          end
        pacman_config.vm.provision :shell, path: "bootstrap-pacman.sh"
    end
end
