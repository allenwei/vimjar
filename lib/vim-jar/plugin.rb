module Vim
  module Jar
    module Plugin
      autoload :Git, 'vim-jar/plugin/git.rb'

      def self.update 
        Dir.chdir(config.vim_home) do 
          system("git submodule update")
        end
      end

      def self.installed
        @installed ||= Dir[config.bundle_home.join("*")].map { |bundle_path| File.basename(bundle_path) }
      end

      def self.config
        ::Vim::Jar::Config.instance
      end
    end
  end
end


