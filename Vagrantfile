# -*- mode: ruby -*-
Vagrant.configure("2") do |config|
  config.vm.box =     "puppetlabs/centos-6.6-64-puppet-enterprise"

  (1..3).each {|vm_id|
    config.vm.define "node#{vm_id}" do |config|
      config.vm.hostname = "node#{vm_id}"
      config.vm.network "private_network", ip: "172.21.0.10#{vm_id}"

      config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "manifests"
        puppet.manifest_file  = "init.pp"
        puppet.module_path    = "modules"
      end
      #if vm_id == 3
      #  config.vm.provision :ansible do |ansible|
      #    ansible.limit          = "all"
      #    ansible.inventory_path = "hosts.ini"
      #    ansible.playbook       = "./playbook.yml"
      #  end
      #end
    end
  }

end
