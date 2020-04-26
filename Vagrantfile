# -*- mode: ruby -*-
# vi: set ft=ruby :

require './defaults/vagrant.rb'

instances = ["k8s-master", "node01", "node02"] # Add servers at you need them: jenkins

Vagrant.configure(2) do |config|
  config.ssh.insert_key = false
  config.vm.synced_folder "..", "/vagrant"
    
  config.vm.provider "virtualbox" do |vb|
    vb.memory = RAM
    vb.cpus = CPU
  end
  
  config.vm.provision "ansible" do |ansible|
    ansible.verbose = "vv"
    ansible.limit = "all"                
    ansible.playbook = PLAYBOOK                
    ansible.groups = {
      "bootstrap" => ["k8s-master"],
#      "infra" => ["jenkins"],
      "nodes" => ["node01", "node02"]
      }
  end

  instances.each_with_index.map do |item, index|
    config.vm.define "#{item}" do |inst|
      inst.vm.box = IMAGE_NAME
      inst.vm.hostname = item + DOMAIN
      inst.vm.network "private_network", ip: NODE_NET + "#{index + 10}", netmask: NETMASK   
    end
  end
end
