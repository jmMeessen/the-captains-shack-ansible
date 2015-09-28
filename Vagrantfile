# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure(2) do |config|

  config.vm.box = "centos7"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "https://f0fff3908f081cb6461b407be80daf97f07ac418.googledrive.com/host/0BwtuV7VyVTSkUG1PM3pCeDJ4dVE/centos7.box"

  #config.vm.network :public_network
  config.ssh.port = 10022
  config.ssh.username = "jmm"
  config.ssh.private_key_path = "/Users/jmm/.ssh/id_rsa"
  config.vm.provision "ansible" do |ansible|
      ansible.playbook = "playbook.yml"
  end

end
