require 'yaml'

CONFIG = YAML.load_file(File.join(File.dirname(__FILE__), 'config.yml'))

Vagrant.configure("2") do |config|
  config.ssh.insert_key = false

  config.vm.define CONFIG['bootstrap']['name'] do |cfg|
    cfg.vm.box = CONFIG['bootstrap']['box']
    cfg.vm.network "public_network", ip: CONFIG['bootstrap']['ip']
    cfg.vm.hostname = CONFIG['bootstrap']['hostname']
    
    cfg.vm.provider "virtualbox" do |v|
      v.memory = CONFIG['bootstrap']['memory']
      v.cpus = CONFIG['bootstrap']['cpu']
      v.name = CONFIG['bootstrap']['name']
    end

    # ssh 비밀번호인증 활성화
    cfg.vm.provision "shell", inline: <<-SCRIPT
      sed -i -e 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
      systemctl restart sshd
    SCRIPT

    # install linux package
    cfg.vm.provision "shell", inline: <<-SCRIPT
      yum install epel-release -y
      yum install vim git tree wget net-tools -y
    SCRIPT
    
    # time sync
    cfg.vm.provision "file", source: "chrony.conf", destination: "/tmp/chrony.conf"
    cfg.vm.provision "shell", inline: <<-SCRIPT
      timedatectl set-timezone Asia/Seoul
      yum install -y git net-tools
      cp /tmp/chrony.conf /etc/chrony.conf
      systemctl enable chronyd
      systemctl restart chronyd
    SCRIPT

    # copy konvoy configuration
    cfg.vm.provision "file", source: "cluster.yml", destination: "cluster.yml"
    cfg.vm.provision "file", source: "inventory.yml", destination: "inventory.yml"
  end

  # controlplane
  config.vm.define CONFIG['controlplane']['name'] do |cfg|
    cfg.vm.box = CONFIG['controlplane']['box']
    cfg.vm.network "public_network", ip: CONFIG['controlplane']['ip']
    cfg.vm.hostname = CONFIG['controlplane']['hostname']
    
    cfg.vm.provider "virtualbox" do |v|
      v.memory = CONFIG['controlplane']['memory']
      v.cpus = CONFIG['controlplane']['cpu']
      v.name = CONFIG['controlplane']['name']
    end

    # ssh 비밀번호인증 활성화
    cfg.vm.provision "shell", inline: <<-SCRIPT
      sed -i -e 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
      systemctl restart sshd
    SCRIPT

    # install linux package
    cfg.vm.provision "shell", inline: <<-SCRIPT
      yum install epel-release -y
      yum install vim git tree wget net-tools -y
    SCRIPT

    # time sync
    cfg.vm.provision "file", source: "chrony.conf", destination: "/tmp/chrony.conf"
    cfg.vm.provision "shell", inline: <<-SCRIPT
      timedatectl set-timezone Asia/Seoul
      yum install -y git net-tools
      cp /tmp/chrony.conf /etc/chrony.conf
      systemctl enable chronyd
      systemctl restart chronyd
    SCRIPT

    # common configuration
    cfg.vm.provision "file", source: "common-configuration.sh", destination: "/tmp/common-configuration.sh"
    cfg.vm.provision "shell", inline: <<-SCRIPT
      chmod +x /tmp/common-configuration.sh
      /tmp/common-configuration.sh
    SCRIPT
  end

  # worker1
  config.vm.define CONFIG['worker1']['name'] do |cfg|
    cfg.vm.box = CONFIG['worker1']['box']
    cfg.vm.network "public_network", ip: CONFIG['worker1']['ip']
    cfg.vm.hostname = CONFIG['worker1']['hostname']
    
    cfg.vm.provider "virtualbox" do |v|
      v.memory = CONFIG['worker1']['memory']
      v.cpus = CONFIG['worker1']['cpu']
      v.name = CONFIG['worker1']['name']
    end

    # ssh 비밀번호인증 활성화
    cfg.vm.provision "shell", inline: <<-SCRIPT
      sed -i -e 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
      systemctl restart sshd
    SCRIPT

    # install linux package
    cfg.vm.provision "shell", inline: <<-SCRIPT
      yum install epel-release -y
      yum install vim git tree wget net-tools -y
    SCRIPT

    # time sync
    cfg.vm.provision "file", source: "chrony.conf", destination: "/tmp/chrony.conf"
    cfg.vm.provision "shell", inline: <<-SCRIPT
      timedatectl set-timezone Asia/Seoul
      yum install -y git net-tools
      cp /tmp/chrony.conf /etc/chrony.conf
      systemctl enable chronyd
      systemctl restart chronyd
    SCRIPT

    # common configuration
    cfg.vm.provision "file", source: "common-configuration.sh", destination: "/tmp/common-configuration.sh"
    cfg.vm.provision "shell", inline: <<-SCRIPT
      chmod +x /tmp/common-configuration.sh
      /tmp/common-configuration.sh
    SCRIPT
  end

  # worker2
  config.vm.define CONFIG['worker2']['name'] do |cfg|
    cfg.vm.box = CONFIG['worker2']['box']
    cfg.vm.network "public_network", ip: CONFIG['worker2']['ip']
    cfg.vm.hostname = CONFIG['worker2']['hostname']
    
    cfg.vm.provider "virtualbox" do |v|
      v.memory = CONFIG['worker2']['memory']
      v.cpus = CONFIG['worker2']['cpu']
      v.name = CONFIG['worker2']['name']
    end

    # ssh 비밀번호인증 활성화
    cfg.vm.provision "shell", inline: <<-SCRIPT
      sed -i -e 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
      systemctl restart sshd
    SCRIPT

    # install linux package
    cfg.vm.provision "shell", inline: <<-SCRIPT
      yum install epel-release -y
      yum install vim git tree wget net-tools -y
    SCRIPT

    # time sync
    cfg.vm.provision "file", source: "chrony.conf", destination: "/tmp/chrony.conf"
    cfg.vm.provision "shell", inline: <<-SCRIPT
      timedatectl set-timezone Asia/Seoul
      yum install -y git net-tools
      cp /tmp/chrony.conf /etc/chrony.conf
      systemctl enable chronyd
      systemctl restart chronyd
    SCRIPT

    # common configuration
    cfg.vm.provision "file", source: "common-configuration.sh", destination: "/tmp/common-configuration.sh"
    cfg.vm.provision "shell", inline: <<-SCRIPT
      chmod +x /tmp/common-configuration.sh
      /tmp/common-configuration.sh
    SCRIPT
  end

  # worker3
  config.vm.define CONFIG['worker3']['name'] do |cfg|
    cfg.vm.box = CONFIG['worker3']['box']
    cfg.vm.network "public_network", ip: CONFIG['worker3']['ip']
    cfg.vm.hostname = CONFIG['worker3']['hostname']
    
    cfg.vm.provider "virtualbox" do |v|
      v.memory = CONFIG['worker3']['memory']
      v.cpus = CONFIG['worker3']['cpu']
      v.name = CONFIG['worker3']['name']
    end

    # ssh 비밀번호인증 활성화
    cfg.vm.provision "shell", inline: <<-SCRIPT
      sed -i -e 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
      systemctl restart sshd
    SCRIPT

    # install linux package
    cfg.vm.provision "shell", inline: <<-SCRIPT
      yum install epel-release -y
      yum install vim git tree wget net-tools -y
    SCRIPT

    # time sync
    cfg.vm.provision "file", source: "chrony.conf", destination: "/tmp/chrony.conf"
    cfg.vm.provision "shell", inline: <<-SCRIPT
      timedatectl set-timezone Asia/Seoul
      yum install -y git net-tools
      cp /tmp/chrony.conf /etc/chrony.conf
      systemctl enable chronyd
      systemctl restart chronyd
    SCRIPT

    # common configuration
    cfg.vm.provision "file", source: "common-configuration.sh", destination: "/tmp/common-configuration.sh"
    cfg.vm.provision "shell", inline: <<-SCRIPT
      chmod +x /tmp/common-configuration.sh
      /tmp/common-configuration.sh
    SCRIPT
  end

  # worker4
  config.vm.define CONFIG['worker4']['name'] do |cfg|
    cfg.vm.box = CONFIG['worker4']['box']
    cfg.vm.network "public_network", ip: CONFIG['worker4']['ip']
    cfg.vm.hostname = CONFIG['worker4']['hostname']
    
    cfg.vm.provider "virtualbox" do |v|
      v.memory = CONFIG['worker4']['memory']
      v.cpus = CONFIG['worker4']['cpu']
      v.name = CONFIG['worker4']['name']
    end

    # ssh 비밀번호인증 활성화
    cfg.vm.provision "shell", inline: <<-SCRIPT
      sed -i -e 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
      systemctl restart sshd
    SCRIPT

    # install linux package
    cfg.vm.provision "shell", inline: <<-SCRIPT
      yum install epel-release -y
      yum install vim git tree wget net-tools -y
    SCRIPT

    # time sync
    cfg.vm.provision "file", source: "chrony.conf", destination: "/tmp/chrony.conf"
    cfg.vm.provision "shell", inline: <<-SCRIPT
      timedatectl set-timezone Asia/Seoul
      yum install -y git net-tools
      cp /tmp/chrony.conf /etc/chrony.conf
      systemctl enable chronyd
      systemctl restart chronyd
    SCRIPT

    # common configuration
    cfg.vm.provision "file", source: "common-configuration.sh", destination: "/tmp/common-configuration.sh"
    cfg.vm.provision "shell", inline: <<-SCRIPT
      chmod +x /tmp/common-configuration.sh
      /tmp/common-configuration.sh
    SCRIPT
  end
end