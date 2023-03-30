# vagrant-k8s-amd64

Vagrant + Ansible + Parallels for Multi-Node Local k8s Test Environment

Based on [this k8s blog post](https://kubernetes.io/blog/2019/03/15/kubernetes-setup-using-ansible-and-vagrant/)

## Prerequisites
* ansible
* vagrant
* vagrant provider (e.g., virtualbox)
* tailscale account
* amd64-based host machine

## Assumptions
* vagrant provider is configured as virtualbox
* you've forked this repo and created your own `vault-vars.yml` in `kubernetes-setup/`
    * include `tailscale_auth_key: tskey-xxxxxxxxxxxxxxxxxxxxxxxxxx` in the file
        * replace `tskey-xxxxxxxxxxxxxxxxxxxxxxxxxx` with your tailscale access key
    * run `ansible-vault encrypt vault_vars.yml`
        * save the password you use; that will be required during ansible playbook execution
* basic working knowledge of k8s, vagrant, ansible

## Directions
Run `vagrant up`
Input ansible vault password as described above
You have a local k8s cluster! 