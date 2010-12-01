module Vim
  module Jar 
    class Config 
      require 'singleton'
      include Singleton
      
      PATHOGEN_URL = "http://www.vim.org/scripts/download_script.php?src_id=12116"

      def vim_jar_root 
        Pathname.new(File.expand_path("../../",File.dirname(__FILE__)))
      end

      def vim_jar_lib 
        Pathname.new(vim_jar_root.join("lib"))
      end

      def user_home 
        Pathname.new(ENV['VIM_JAR_USER_HOME'] || ::Gem.user_home)
      end

      def vim_home 
        Pathname.new(user_home.join(".vim"))
      end

      def vimrc_path
        user_home.join(".vimrc")
      end

      def under_git?
        @under_git ||= File.exist?(vim_home.join(".git"))
      end

      def gitmodules_file_path
        vim_home.join(".gitmodules")
      end

      def gitconfig_file_path
        vim_home.join(".git",'config')
      end

      def bundle_home 
        Pathname.new(vim_home.join("bundle"))
      end


      def autoload_home 
        Pathname.new(vim_home.join("autoload"))
      end

      def pathogen_path
        Pathname.new(vim_home.join("autoload",'pathogen.vim'))
      end

      def yaml_path
        @yaml_path ||= File.expand_path("./plugins.yml",File.dirname(__FILE__))
      end

      def pathogen_vim_path(version="1.2") 
        vim_jar_lib.join("vim-jar","pathogen","pathogen_v#{version}.vim")
      end


      def check 
        %w[vim_home vimrc_path].each do |method_name|
          path = self.send(method_name)
          raise InitError.new("#{path} doesn't exist") unless File.exist?(path)
        end
        not_under_git_message = <<-EOF
your .vim folder is not a git repository. 

  You can not make use of git submodule to manage your plugins.
  You need make your .vim to be a git repository.
  Futher more you can push your git repository to www.github.com.
        EOF
        raise InitError.new(not_under_git_message) unless under_git?
        if !File.exist?(bundle_home)
          FileUtils.mkdir_p(bundle_home) 
          STDOUT.puts "create folder for pathogen in #{bundle_home}"
        end
      end

      def install_pathogen
        FileUtils.mkdir_p(autoload_home) if !File.exist?(autoload_home)
        FileUtils.cp pathogen_vim_path, pathogen_path
      end
    end 
  end
end
