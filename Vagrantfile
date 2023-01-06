# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.vm.provider "virtualbox" do |rs|
    rs.memory = 2048
    rs.cpus = 2
  end

  # Will not check for box updates during every startup.
  config.vm.box = "ubuntu/focal64"
  #config.vm.box_version = "20221213.0.0"
  config.vm.box_check_update = false

  # VM1: Master node where ansible will be installed
  config.vm.define "controller" do |controller|
    controller.vm.hostname = "controller.anslab.com"
    controller.vm.network "private_network", ip: "192.168.56.10"
    controller.vm.provision "shell", path: "../ansible-lab/bootstrap.sh"
    controller.vm.provision "file", source: "../ansible-lab/key_gen.sh", destination: "/home/vagrant/"
    controller.vm.provision "file", source: "../ansible-lab/k8s", destination: "/home/vagrant/k8s"
  end

  # VM2 : Managed node 1.
  config.vm.define "master" do |m1|
    m1.vm.hostname = "master.anslab.com"
    m1.vm.network "private_network", ip: "192.168.56.11"
    m1.vm.provision "shell", path: "../ansible-lab/bootstrap.sh"
  end

  # VM3: Managed node 2.
  config.vm.define "worker1" do |m2|
    m2.vm.hostname = "worker1.anslab.com"
    m2.vm.network "private_network", ip: "192.168.56.12"
    m2.vm.provision "shell", path: "../ansible-lab/bootstrap.sh"
  end
  
  # VM4: Managed node 3.
  config.vm.define "worker2" do |m3|
    m3.vm.hostname = "worker2.anslab.com"
    m3.vm.network "private_network", ip: "192.168.56.13"
    m3.vm.provision "shell", path: "../ansible-lab/bootstrap.sh"
  end
end
