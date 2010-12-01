require 'vim-jar'

module Vim
  module Jar 
    class Cli < Thor
      map "-T" => :list

      desc "init","init environment"
      def init 
        check!
        setup_pathogen unless File.exist?(config.pathogen_path)
        done
      end

      desc "install NAME", "install plugin"
      def install(plugin_name)
        check!
        plugin = ::Vim::Jar::Plugin.find(plugin_name)
        if plugin
          plugin.install 
        else
          STDERR.puts "Can not find plugin '#{plugin_name}'"
          STDERR.puts "you can run 'vim-jar list' to show all the existing plugins"
          exit 1
        end
      end

      desc "list", "list all avaliable plugins"
      def list
        str = ::Vim::Jar::Plugin.plugins.map do |plugin_attr| 
          "#{plugin_attr['name']}: #{plugin_attr['desc']}"
        end.join("\n")
        STDOUT.puts str
      end

      desc "import", "import plugin info from github.com"
      def import(github_url)
        begin 
          ::Vim::Jar::Importer.import(github_url)
          STDOUT.puts "'#{github_url}' has import to our local cache"
        rescue ImportError => e 
          STDERR.puts "Can not import '#{github_url}', because #{e.message}"
        end
      end

      desc "installed", "list all installed plugins"
      def installed
        STDOUT.puts ::Vim::Jar::Plugin.installed.join("\n")
      end

      desc "uninstall", "uninstall installed plugin"
      def uninstall(name)
        if ::Vim::Jar::Plugin.installed.include?(name)
          ::Vim::Jar::Plugin.uninstall(name)
          STDOUT.puts "plugin #{name} has been already remove from #{config.bundle_home.join(name)}"
        else
          STDERR.puts "You didn't install plugin named #{name}"
        end
        
      end

      private
      def config 
        @config ||= Vim::Jar.config
      end

      def check!
        begin 
          config.check
        rescue InitError => e
          STDERR.puts "Can not init environment because of #{e.message}"
          exit 1
        end
      end

      def git_init 
        #TODO will support init git repo 
      end

      def setup_pathogen
        config = Vim::Jar.config 
        config.install_pathogen
        STDOUT.puts <<-EOF

  Pathogen is installed into #{config.pathogen_path}. 

  NOTICE: you need copy line below into #{config.vimrc_path}.

  call pathogen#runtime_append_all_bundles() 

        EOF
      end

      def done 
        #TODO improve finish message
        STDOUT.puts <<-EOF

  Congratulation!  vim-jar already initialized your environment. 

  Try:

  vim-jar install [PLUGIN_NAME]

        EOF
      end
    end
  end
end
