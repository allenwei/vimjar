require 'pathname'
require 'fileutils'
require 'yaml'
require 'thor'

module Vim
  module Jar
    autoload :Config, 'vim-jar/config' 
    autoload :Plugin, 'vim-jar/plugin' 
    autoload :Installer, 'vim-jar/installer' 
    autoload :Loader, 'vim-jar/Loader' 

    class InitError < RuntimeError; end
    class InstallError < RuntimeError; end
    class ImportError < RuntimeError; end

    class << self 
      def config 
        @config ||= Config.instance
      end

    end    
  end
end
