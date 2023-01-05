# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.vm.provider "virtualbox" do |rs|
    rs.memory = 2048
    rs.cpus = 2
  end

  # Will not check for box updates during every startup.
  configvm.vm.box = "ubuntu/focal64"
  config.vm.box_version = "20221213.0.0"
  config.vm.box_check_update = false

  # VM1: Master node where ansible will be installed
  config.vm.define "vm-1" do |vm1|
    vm1.vm.hostname = "controller.anslab.com"
    vm1.vm.network "private_network", ip: "192.168.56.10"
    vm1.vm.provision "shell", path: "bootstrap.sh"
    vm1.vm.provision "file", source: "key_gen.sh", destination: "/home/vagrant/"
  end

  # VM2 : Managed node 1.
  config.vm.define "vm-2" do |vm2|
    vm2.vm.hostname = "host1.anslab.com"
    vm2.vm.network "private_network", ip: "192.168.56.11"
    vm2.vm.provision "shell", path: "bootstrap.sh"
  end

  # VM3: Managed node 2.
  config.vm.define "vm-3" do |vm3|
    vm3.vm.hostname = "host2.anslab.com"
    vm3.vm.network "private_network", ip: "192.168.56.12"
    vm3.vm.provision "shell", path: "bootstrap.sh"
  end
  
  # VM4: Managed node 3.
  config.vm.define "vm-4" do |vm4|
    vm4.vm.hostname = "host3.anslab.com"
    vm4.vm.network "private_network", ip: "192.168.56.13"
    vm4.vm.provision "shell", path: "bootstrap.sh"
  end
end
