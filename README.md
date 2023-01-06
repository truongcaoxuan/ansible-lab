## I - DEPLOY ANSIBLE USING VAGRANT ON VIRTUALBOX
### Ansible Lab Using Vagrant And Virtualbox

This repository contains three node ansible lab setup using vagrant and virtualbox as the provider.

|    Node Type   | Node Name             |  IP Address  | OS Flavor     |
| ---------------| --------------------- |--------------|---------------|
| VM1-Manager    | manager.anslab.com    | 192.168.56.10 | ubuntu/focal64|
| VM2-Controller | controller.anslab.com | 192.168.56.11 | ubuntu/focal64|
| VM3-Worker 1   | worker1.anslab.com    | 192.168.56.12 | ubuntu/focal64|
| VM4-Worker 2   | worker2.anslab.com    | 192.168.56.13 | ubuntu/focal64|

```
git clone 
cd vagrant
vagrant up
vagrant status
vagrant global-status --prune
```
# II - DEPLOY K8S CLUSTER USING ANSIBLE PLAYBOOK
```
vagrant ssh manager
bash key_gen.sh
ansible -i ~/ansible/inventory all -m ping
```

## 1. Creating a Kubernetes user with Ansible Playbook
```
ansible-playbook -i ~/ansible/inventory ~/k8s/users.yml
```

## 2. Install Kubernetes with Ansible Playbook
```
ansible-playbook -i ~/ansible/inventory ~/k8s/install-k8s.yml
```

## 3. Creating a Kubernetes Cluster Controller Node using Ansible Playbook
```
ansible-playbook -i ~/ansible/inventory ~/k8s/controllers.yml
kubectl get nodes
```

## 4. Join Worker Nodes to Kubernetes Cluster using Ansible Playbook
```
ansible-playbook -i ~/ansible/inventory ~/k8s/join-workers.yml
kubectl get nodes
```
## CLEAN LAB
### Destroy all vm
```
vagrant destroy -f
```

### Reference link.
- https://ostechnix.com/ansible-lab-setup-with-vagrant-and-virtualbox-in-linux/
- https://buildvirtual.net/deploy-a-kubernetes-cluster-using-ansible/
