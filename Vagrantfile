# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/xenial64"
  config.vm.host_name = 'heroku-sinatra-dev'

  config.vm.network "private_network", type: "dhcp"
  config.vm.synced_folder ".", "/vagrant", type: "nfs"

  # web
  config.vm.network "forwarded_port", guest: 80, host: 7778   # http
  config.vm.network "forwarded_port", guest: 443, host: 7779  # https

  config.vm.provision "shell", path: "bootstrap.sh", privileged: true, binary: false

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.customize [ "modifyvm", :id, "--uartmode1", "disconnected" ] # no ubuntu logs in root dir
  end

end
