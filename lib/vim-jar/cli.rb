require 'vim-jar'

module Vim
  module Jar 
    class Cli < Thor
      map "-T" => :installed
      default_task :install

      desc "init","init environment"
      def init 
        check!
        done
        exit 0
      end

      desc "install", "install plugin according to BundleFile"
      def install
        check!
        loader = ::Vim::Jar::Loader.new
        loader.execute
      end

      desc "Edit", "open BundleFile in editor"
      def edit
        check!
        editor = [ENV['BUNDLER_EDITOR'], ENV['VISUAL'], ENV['EDITOR']].find{|e| !e.nil? && !e.empty? }
        if editor
          command = "#{editor} #{config.bundle_file_path}"
          success = system(command)
          raise ::Vim::Jar::InstallError.new "Could not run '#{command}'" unless success
        else
          ::Vim::Jar::InstallError.new("To open BundleFile, set $EDITOR or $BUNDLER_EDITOR")
        end
      end
      

      desc "installed", "list all installed plugins"
      def installed
        STDOUT.puts ::Vim::Jar::Plugin.installed.join("\n")
      end

      desc "update", "Update all installed plugin"
      def update
        check!
        if ::Vim::Jar::Plugin.update 
          STDOUT.puts "All your plugin is up to date."
        end
      end

      desc "uninstall", "uninstall installed plugin"
      def uninstall(name)
        check!
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
