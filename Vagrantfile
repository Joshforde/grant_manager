# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu14" # Try to build off of ubuntu base image?
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.network :private_network, ip: "192.168.33.30"
  config.vm.network :forwarded_port, guest: 5984, host: 6984
  #config.vm.provider :virtualbox do |vb|
  #    vb.customize ["modifyvm", :id, "--memory", "2048"]
  #end
  config.exec.folder = '/vagrant/utils'
  config.exec.env['PATH'] = '$PATH:/vagrant/utils'
  
  config.vm.provision :shell do |s|
      s.inline = "/vagrant/provision.sh"
  end 

end
