Vagrant.configure("2") do |config|
  config.vm.box = "minimal"
  config.vm.box_url = "http://goo.gl/wxdwM"
  config.vm.synced_folder "./src", "/home/vagrant/src"
  config.vm.provision :shell, :path => "clojure_emacs.sh"
end
