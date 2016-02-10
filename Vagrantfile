# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_version ">= 1.7.4"

Vagrant.configure("2") do |config|

  config.vm.box = 'ubuntu/trusty64'
  config.vm.box_check_update = false
  config.vm.synced_folder '~/vms/dark_dragon', '/home/vagrant/dark_dragon', nfs: true
  config.vm.network :private_network, ip: '192.168.56.56'
  config.ssh.forward_agent = true

  config.vm.provision '~~ install git ~~', type: 'shell', inline: <<-SHELL
apt-get update
apt-get install -y git
SHELL

  install_dev_env = <<-SHELL
git clone https://github.com/bentrevor/dev-env.git
/home/vagrant/dev-env/bootstrap --verbose --zsh --vim --dotfiles
SHELL

  install_ruby = <<-SHELL
wget -O ruby-install-0.6.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.6.0.tar.gz > /dev/null
tar -xzvf ruby-install-0.6.0.tar.gz
make install -C ruby-install-0.6.0/

wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz > /dev/null
tar -xzvf chruby-0.3.9.tar.gz
make install -C chruby-0.3.9/

ruby-install ruby-2.2 > /dev/null
source ~/dev-env/zsh/scripts/chruby.zsh
chruby 2.2

gem install bundler
SHELL

  provision_environment(config, 'dd-dev', {
                          host_port: 4569,
                          memory: 4096,
                          cpus: 1,
                          scripts: {
                            'install dev-env' => install_dev_env,
                            'install-ruby' => install_ruby,
                          },
                        })
end

def provision_environment(config, env_name, opts)
  host_port = opts[:host_port]
  memory = opts[:memory]
  cpus = opts[:cpus]
  scripts = opts[:scripts]

  autostart = env_name == 'dd-dev'

  config.vm.define env_name, autostart: autostart do |e|
    e.vm.network 'forwarded_port', host: host_port, guest: 8080, autocorrect: true
    e.vm.provider :virtualbox do |vb|
      vb.memory = memory
      vb.cpus = cpus
    end
  end

  scripts.each do |desc, script|
    config.vm.provision desc, type: 'shell', inline: script
  end
end
