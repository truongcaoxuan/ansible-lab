# Ansible Lab Using Vagrant And Virtualbox

This repository contains three node ansible lab setup using vagrant and virtualbox as the provider.

|    Node Type   | Node Name             |  IP Address  | OS Flavor     |
| ---------------| --------------------- |--------------|---------------|
| VM1-Controller | controller.anslab.com | 192.168.56.10 | ubuntu/focal64|
| VM2 - Host 1   | master.anslab.com     | 192.168.56.11 | ubuntu/focal64|
| VM3 - Host 2   | worker1.anslab.com    | 192.168.56.12 | ubuntu/focal64|
| VM4 - Host 3   | worker2.anslab.com    | 192.168.56.13 | ubuntu/focal64|

Reference detailed explanation using the below link.
https://ostechnix.com/ansible-lab-setup-with-vagrant-and-virtualbox-in-linux/
```
git clone 
cd vagrant
vagrant up
```
# Install K8S
```
vagrant ssh controller
ansible -i ~/ansible_project/inventory all -m ping
```

## Creating a Kubernetes user with Ansible Playbook
```
ansible-playbook -i ~/ansible_project/inventory ~/k8s/users.yml
ansible-playbook -i ~/ansible_project/inventory users.yml
```

## Install Kubernetes with Ansible Playbook
```
ansible-playbook -i ~/ansible_project/inventory ~/k8s/install-k8s.yml
```

## Creating a Kubernetes Cluster Master Node using Ansible Playbook
```
ansible-playbook -i ~/ansible_project/inventory ~/k8s/master.yml
kubectl get nodes
```

## Join Worker Nodes to Kubernetes Cluster using Ansible Playbook
```
ansible-playbook -i ~/ansible_project/inventory ~/k8s/join-workers.yml
kubectl get nodes
```

