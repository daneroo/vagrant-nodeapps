#require_recipe "resolver"
#node[:resolver][:nameservers] = ["8.8.8.8","8.8.4.4"]

require_recipe "apt"

execute "set-timezone-montreal" do
  command "ZZ='America/Montreal'; [ $ZZ = `cat /etc/timezone` ] || (echo $ZZ > /etc/timezone; sudo dpkg-reconfigure --frontend noninteractive tzdata)"
  action :run
end

# Some nice to haves
%w{ iftop curl unzip}.each do |a_package|
  package a_package
end

# ?? %w{ openssl build-essential libssl-dev }


## node.js section - 
# add-apt-repository ppa:chris-lea/node.js
# deb http://ppa.launchpad.net/chris-lea/node.js/ubuntu lucid main
if (false)
    apt_repository "chris-lea-node" do
      uri "http://ppa.launchpad.net/chris-lea/node.js/ubuntu"
      distribution "lucid"
      keyserver "keyserver.ubuntu.com"
      key "C7917B12"
      components ["main"]
      action :add
    end

    # install node.js
    %w{ nodejs }.each do |a_package|
      package a_package
    end

    # node-npm
    # the curl |sh seems to return a non-zero (2) exit status, so we echo OK.
    execute "node.js-npm" do
      command "[ -e '/usr/bin/npm' ] || (curl http://npmjs.org/install.sh | clean=no sh;)"
      action :run
    end
end
