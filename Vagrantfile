Vagrant::Config.run do |config|
  config.vm.box = "lucid32"
  config.vm.box_url = "http://files.vagrantup.com/lucid32.box"

  config.vm.customize do |vm|
    #vm.memory_size = 1024
  end  
  # config.vm.network "33.33.33.10"
	#config.vm.network "192.168.11.12"
  
  config.vm.forward_port "web", 80, 8080
  config.vm.forward_port "ssl", 443, 8443
    
  # if this directory (or link) this it will cache all update packages.
  ## note: moved the link mount point from /var/cache/apt to /var/cache/apt/archives
  ##  it must already have a subdirectory name partial
  path="varcacheapt"
  if File.exists?(path) && File.directory?(path)
    if File.exists?(path+'/partial') && File.directory?(path+'/partial')
      puts("DD:apt-cache found directory #{path} mounting as /var/cache/apt/archives")
      config.vm.share_folder "v-aptcache", "/var/cache/apt/archives", path
    else
      puts("DD:apt-cache directory #{path}/partial not found: mkdir varcacheapt/partial ??")
    end
  else 
    puts("DD:apt-cache directory #{path} not found cannot mount as /var/cache/apt/archives")
  end

  # Enable and configure the chef solo provisioner
  config.vm.provision :chef_solo do |chef|
      # We're going to download our cookbooks from the web
      #chef.recipe_url = "http://files.vagrantup.com/getting_started/cookbooks.tar.gz"
      chef.cookbooks_path =  ["cookbooks"]

      chef.add_recipe("vagrant_main")
      #   chef.json = { :mysql_password => "foo" }
    end

end
