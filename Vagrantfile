# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV['VAGRANT_NO_PARALLEL'] = 'yes'

Vagrant.configure(2) do |config|

  config.vm.provision "shell", path: "bootstrap.sh"

  # Kubernetes Master Server
  config.vm.define "kmaster" do |kmaster|
    kmaster.vm.box = "centos/7"
    kmaster.vm.hostname = "kmaster.example.com"
    kmaster.vm.network "public_network"
      #use_dhcp_assigned_default_route: true
    kmaster.vm.network "private_network", ip: "172.42.42.100"
    kmaster.vm.provider "virtualbox" do |v|
      v.name = "kmaster"
      v.memory = 1792
      v.cpus = 2
    end
    #kmaster.vm.provision "shell", path: "bootstrap_kmaster.sh"
  end

  NodeCount = 1

  # Kubernetes Worker Nodes
  (1..NodeCount).each do |i|
    config.vm.define "kworker#{i}" do |workernode|
      workernode.vm.box = "centos/7"
      workernode.vm.hostname = "kworker#{i}.example.com"
      workernode.vm.network "public_network",
        use_dhcp_assigned_default_route: true
      workernode.vm.network "private_network", ip: "172.42.42.10#{i}"
      workernode.vm.provider "virtualbox" do |v|
        v.name = "kworker#{i}"
        v.memory = 1792
        v.cpus = 1
      end
      #workernode.vm.provision "shell", path: "bootstrap_kworker.sh"
    end

  end

  config.vm.define "ansible" do |ansible|
    ansible.vm.box = "centos/7"
    ansible.vm.hostname = "ansible.example.com"
    ansible.vm.network "public_network",
      use_dhcp_assigned_default_route: true
    ansible.vm.provision "shell", path: "ansible.sh"
    ansible.vm.network "private_network", ip: "172.42.42.99"
    ansible.vm.provider "virtualbox" do |v|
      v.name = "ansible"
      v.memory = 1024
      v.cpus = 1
    end
  end

end
