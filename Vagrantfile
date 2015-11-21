require 'yaml'

VAGRANTFILE_API_VERSION ||= "2"

vmFold = "vagrant";

configPath = vmFold + "/config.yaml"
afterScriptPath = vmFold + "/after.sh"
aliasesPath = vmFold + "/aliases"

require File.expand_path(vmFold + '/Bootstrap.rb')

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    if File.exists? aliasesPath then
        config.vm.provision "file", source: aliasesPath, destination: "~/.bash_aliases"
    end

    if File.exists? configPath then
        Bootstrap.configure(config, YAML::load(File.read(configPath)))
    end

    if File.exists? afterScriptPath then
        config.vm.provision "shell", path: afterScriptPath
    end
end
