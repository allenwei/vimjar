require 'vim-jar'
module Vim
  module Jar 
    class Cli
      class << self 
        PATHOGEN_URL = "http://www.vim.org/scripts/download_script.php?src_id=12116"
        def init 
          check!
          setup_pathogen unless File.exist?(config.pathogen_path)
          done
        end

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

        def list(options={}) 
          ::Vim::Jar::Plugin.plugins.each do |plugin_attr| 
            STDOUT.puts "#{plugin_attr['name']}: #{plugin_attr['desc']}"
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
          FileUtils.mkdir_p(config.autoload_home) if !File.exist?(config.autoload_home)
          install_pathogen(config) 
        end

        def install_pathogen(config) 
          system("curl #{PATHOGEN_URL} -o #{config.pathogen_path}")
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
end
