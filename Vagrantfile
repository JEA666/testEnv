# -*- mode: ruby -*-
# vi: set ft=ruby :

require './defaults/vagrant.rb'

instances = ['k8s-manager', 'jenkins']

Vagrant.configure(2) do |config|
  config.ssh.insert_key = false
  config.vm.synced_folder "..", "/vagrant"
  
  config.vm.provider "virtualbox" do |vb|
    vb.memory = RAM
    vb.cpus = CPU
  end

  config.vm.provision :ansible do |ansible|
    ansible.playbook = PLAYBOOK
    ansible.limit = "all"
    ansible.verbose = "v"
  end

#   config.vm.define MANAGER do |manager|
#     manager.vm.box = IMAGE_NAME
#     manager.vm.network "private_network", ip: MANAGER_IP
#     manager.vm.hostname = MANAGER
#   end

  instances.each_with_index.map do |item, index|
    config.vm.define "#{item}" do |inst|
      inst.vm.box = IMAGE_NAME
      inst.vm.hostname = item + DOMAIN
      inst.vm.network "private_network", ip: NODE_NET + "#{index + 10}", netmask: NETMASK
    end
  end

  (1..NODES).each do |machineid|
    config.vm.define "node#{machineid}" do |node|
      node.vm.box = IMAGE_NAME
      node.vm.hostname = "node#{machineid}" + DOMAIN
      node.vm.network "private_network", ip: NODE_NET+"#{39 + machineid}", netmask: NETMASK
      node.vm.provider "virtualbox" do |vb|
        vb.memory = "2048"
        vb.cpus = "2"
      end
    end
  end
end

