# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure(2) do |config|

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 2
  end

  config.vm.box = "centos/7"

  config.vm.hostname = "vagrant"

  #config.vm.network :public_network
  config.vm.network "forwarded_port", guest: 80, host: 32760, auto_correct: true
  config.vm.network "forwarded_port", guest: 443, host: 32761, auto_correct: true
  config.vm.network "forwarded_port", guest: 10022, host: 10022, auto_correct: true
  config.vm.network "forwarded_port", guest: 10080, host: 10080, auto_correct: true

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "vagrant-sandbox.yml"
    ansible.ask_vault_pass = true
  end

end
