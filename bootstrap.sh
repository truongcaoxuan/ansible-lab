#!/usr/bin/env bash

# vagrant by default creates its own keypair for all the machines. Password based authentication will be disabled by default and enabling it so password based auth can be done.

sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo systemctl restart sshd

# Supressing the banner message everytime you connect to the vagrant box.

touch /home/vagrant/.hushlogin

# Updating the hosts file for all the 4 nodes with the IP given in vagrantfile

# 192.168.56.10 controller.ansible.com vm-1
# 192.168.56.11 k8s-master.ansible.com vm-2
# 192.168.56.12 k8s-worker1.ansible.com vm-3
# 192.168.56.13 k8s-worker2.ansible.com vm-4

echo -e "192.168.56.10 controller.anslab.com vm-1\n192.168.56.11 k8s-master.anslab.com vm-2\n192.168.56.12 k8s-worker1.anslab.com vm-3\n192.168.56.13 k8s-worker2.anslab.com vm-4" >> /etc/hosts

# Installing necessary packages 

sudo apt update && sudo apt -y install curl wget net-tools iputils-ping python3-pip sshpass

# Install ansible using pip only in controller node

if [[ $(hostname) = "controller" ]]; then
  sudo pip3 install ansible
fi

