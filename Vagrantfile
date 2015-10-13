# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure(2) do |config|

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 2
  end

  config.vm.box = "centos7"

  config.vm.box_url = "https://f0fff3908f081cb6461b407be80daf97f07ac418.googledrive.com/host/0BwtuV7VyVTSkUG1PM3pCeDJ4dVE/centos7.box"

  #config.vm.network :public_network
  config.vm.network "forwarded_port", guest: 80, host: 32760, auto_correct: true

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "bootstrap.yml"
  end

end
