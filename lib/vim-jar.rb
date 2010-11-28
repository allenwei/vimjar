require 'pathname'
require 'fileutils'
require 'yaml'

module Vim
  module Jar
    autoload :Config, 'vim-jar/config' 
    autoload :Plugin, 'vim-jar/plugin' 
    autoload :Installer, 'vim-jar/installer' 
    class InitError < RuntimeError; end
    class InstallError < RuntimeError; end

    class << self 
      def config 
        @config ||= Config.instance
      end

    end    
  end
end
