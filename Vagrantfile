# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'vagrant-hostmanager'

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.define :master do |vmconfig|
    vmconfig.vm.box = "debian-7-amd64"
  
    vmconfig.vm.network :private_network, ip: "192.168.33.10"
    vmconfig.vm.hostname = "saltmaster"
    vmconfig.hostmanager.aliases = "salt"

    vmconfig.vm.synced_folder "salt/roots/", "/srv/", :nfs => true

    vmconfig.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512"]
    end
    vmconfig.vm.provision :hostmanager
    vmconfig.vm.provision :salt do |salt|
      salt.install_type = "stable"
      salt.install_master = true
      salt.always_install = false
      #salt.bootstrap_script = "salt-bootstrap/bootstrap-salt.sh"
      #salt.bootstrap_options = "-D"
      ## Config Options
      #salt.minion_config = "salt/minion"
      #salt.master_config = "salt/master"
      salt.master_key = "salt/key/master.pem"
      salt.master_pub = "salt/key/master.pub"
      salt.minion_key = "salt/key/minion.pem"
      salt.minion_pub = "salt/key/minion.pub"
      salt.seed_master = { saltmaster: salt.minion_pub, obsd1: salt.minion_pub, obsd2: salt.minion_pub, db1: salt.minion_pub }
      #salt.verbose = true
      salt.temp_config_dir = "/tmp"
      salt.run_highstate = true
    end
  end

  config.vm.define :obsd1 do |o1config|
    o1config.vm.box = "obsd-current-i386"
    o1config.vm.network :private_network, ip: "192.168.33.21"
    o1config.vm.network :private_network, ip: "192.168.34.21"
    o1config.vm.hostname = "obsd1"
    o1config.vm.synced_folder "salt/key/", "/vagrant/", :nfs => true
    #o1config.vm.synced_folder ".", "/vagrant/", :nfs => true
    o1config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "256"]
    end
    o1config.vm.provision :hostmanager
    o1config.vm.provision "shell", path: "obsd-saltinit.sh"
  end
  config.vm.define :obsd2 do |o2config|
    o2config.vm.box = "obsd-current-i386"
    o2config.vm.network :private_network, ip: "192.168.33.22"
    o2config.vm.network :private_network, ip: "192.168.34.22"
    o2config.vm.hostname = "obsd2"
    o2config.vm.synced_folder "salt/key/", "/vagrant/", :nfs => true
    #o2config.vm.synced_folder ".", "/vagrant/", :nfs => true
    o2config.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "256"]
    end
    o2config.vm.provision :hostmanager
    o2config.vm.provision "shell", path: "obsd-saltinit.sh"
  end
  
  config.vm.define :db1 do |db1config|
    db1config.vm.box = "debian-7-amd64"
    db1config.vm.network :private_network, ip: "192.168.34.101"
    db1config.vm.hostname = "db1"
    db1config.vm.synced_folder ".", "/vagrant", disabled: true
    db1config.vm.provision :hostmanager
    db1config.vm.provision :salt do |db1salt|
      db1salt.install_type = "stable"
      db1salt.always_install = false
      db1salt.master_key = "salt/key/master.pem"
      db1salt.master_pub = "salt/key/master.pub"
      db1salt.minion_key = "salt/key/minion.pem"
      db1salt.minion_pub = "salt/key/minion.pub"
    end
  end
end
