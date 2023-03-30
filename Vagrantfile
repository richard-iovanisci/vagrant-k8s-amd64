IMAGE_NAME = "bento/ubuntu-20.04"
N = 2

Vagrant.configure("2") do |config|
    config.ssh.insert_key = false

    config.vm.provider "virtualbox" do |v|
        v.memory = 4096
        v.cpus = 2
    end
      
    config.vm.define "k8s-control" do |control|
        control.vm.box = IMAGE_NAME
        control.vm.network "private_network", ip: "192.168.50.10"
        control.vm.hostname = "k8s-control"
        control.vm.provision "ansible" do |ansible|
            ansible.playbook = "kubernetes-setup/control-playbook.yml"
            ansible.ask_vault_pass = true
            ansible.extra_vars = {
                worker_ip: "192.168.50.10",
            }
        end
    end

    (1..N).each do |i|
        config.vm.define "worker-#{i}" do |worker|
            worker.vm.box = IMAGE_NAME
            worker.vm.network "private_network", ip: "192.168.50.#{i + 10}"
            worker.vm.hostname = "worker-#{i}"
            worker.vm.provision "ansible" do |ansible|
                ansible.playbook = "kubernetes-setup/worker-playbook.yml"
                ansible.extra_vars = {
                    worker_ip: "192.168.50.#{i + 10}",
                }
            end
        end
    end
end