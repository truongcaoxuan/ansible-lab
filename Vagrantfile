# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.vm.provider "virtualbox" do |rs|
    rs.memory = 2048
    rs.cpus = 2
  end

  # Will not check for box updates during every startup.
  config.vm.box = "ubuntu/focal64"
  config.vm.box_version = "20221213.0.0"
  config.vm.box_check_update = false

  # VM1: Ansible Managerment node where ansible will be installed
  config.vm.define "manager" do |manager|
    manager.vm.hostname = "manager.anslab.com"
    manager.vm.network "private_network", ip: "192.168.56.10"
    manager.vm.provision "shell", inline: <<-SHELL
        echo "nameserver 8.8.8.8" >> /etc/resolv.conf
        echo "nameserver 1.1.1.1" >> /etc/resolv.conf
      SHELL
    manager.vm.provision "shell", path: "../ansible-lab/bootstrap.sh"
    manager.vm.provision "file", source: "../ansible-lab/key_gen.sh", destination: "/home/vagrant/"
    manager.vm.provision "file", source: "../ansible-lab/k8s", destination: "/home/vagrant/k8s"
  end

  # VM2 : K8S Controller node.
  config.vm.define "controller" do |m1|
    m1.vm.hostname = "controller.anslab.com"
    m1.vm.network "private_network", ip: "192.168.56.11"
    m1.vm.provision "shell", inline: <<-SHELL
        echo "nameserver 8.8.8.8" >> /etc/resolv.conf
        echo "nameserver 1.1.1.1" >> /etc/resolv.conf
      SHELL
    m1.vm.provision "shell", path: "../ansible-lab/bootstrap.sh"
  end

  # VM3: K8S Worker node 1.
  config.vm.define "worker1" do |m2|
    m2.vm.hostname = "worker1.anslab.com"
    m2.vm.network "private_network", ip: "192.168.56.12"
    m2.vm.provision "shell", inline: <<-SHELL
        echo "nameserver 8.8.8.8" >> /etc/resolv.conf
        echo "nameserver 1.1.1.1" >> /etc/resolv.conf
      SHELL
    m2.vm.provision "shell", path: "../ansible-lab/bootstrap.sh"
  end
  
  # VM4: K8S Worker node 2.
  config.vm.define "worker2" do |m3|
    m3.vm.hostname = "worker2.anslab.com"
    m3.vm.network "private_network", ip: "192.168.56.13"
    m3.vm.provision "shell", inline: <<-SHELL
        echo "nameserver 8.8.8.8" >> /etc/resolv.conf
        echo "nameserver 1.1.1.1" >> /etc/resolv.conf
      SHELL
    m3.vm.provision "shell", path: "../ansible-lab/bootstrap.sh"
  end
end
