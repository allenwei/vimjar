module Vim
  module Jar 
    module Plugin
      class Git
        include ::Vim::Jar::Installer::Git

        attr_reader :name, :url, :target_path

        def initialize(url, args={}) 
          if url !~ /(https|git):\/\/github\.com/
            raise InstallError.new("Not support this git repository #{url}.")
          end
          if url !~ /\.git$/ 
            raise InstallError.new("#{url} is not a valid github repository url.")
          end
          if url.split("/").last =~ /(.+?)\.git$/
            @name = $1
          else
            raise InstallError.new("#{url} is not a valid github repository url.")
          end
          @url = url
          @target_path = config.bundle_home.join(name)
        end

        def install
          if !File.exist?(target_path) 
            install_to(url, target_path) 
          end
        end

        def uninstall
          uninstall_for(self.name)
        end

        def config 
          ::Vim::Jar::Config.instance
        end
      end
    end
  end
end
