# vagrant-k8s-amd64

Vagrant + Ansible + Parallels for Multi-Node Local k8s Test Environment

Based on [this k8s blog post](https://kubernetes.io/blog/2019/03/15/kubernetes-setup-using-ansible-and-vagrant/)

## Prerequisites
* ansible
* vagrant
* vagrant provider (e.g., virtualbox)

## Assumptions
* amd64-based host machine
* vagrant provider is configured as virtualbox
* basic working knowledge of k8s, vagrant, ansible
* you have forked this repo or changed your local copy sudh that:
    * `become_user` in 'Generate kube join command' task for control-plane playbook is changed to your current user (host machine)

## Directions
Run `vagrant up`
You have a local k8s cluster! 