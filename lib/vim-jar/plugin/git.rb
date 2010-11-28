module Vim
  module Jar 
    module Plugin
      class Git
        include ::Vim::Jar::Installer::Git

        attr_reader :name, :url, :target_path

        def initialize(attrs) 
          attrs.each_pair do |name, value|
            if self.respond_to? name 
              self.instance_variable_set("@#{name}", value)
            end
          end
          @target_path = config.bundle_home.join(name)
        end

        def install
          if !File.exist?(target_path) 
            install_to(url, target_path) 
          else
            raise ::Vim::Jar::Installer.new("")
          end
        end

        def config 
          ::Vim::Jar::Config.instance
        end
      end
    end
  end
end
