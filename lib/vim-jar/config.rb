module Vim
  module Jar 
    class Config 
      require 'singleton'
      include Singleton

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

      def pathogen_vim_path(version="1.2") 
        vim_jar_lib.join("vim-jar","pathogen","pathogen_v#{version}.vim")
      end

      def bundle_file_path
        vim_home.join("BundleFile")
      end

      def bundle_template_file_path 
        vim_jar_lib.join("templates", "BundleFile")
      end

      def check 
        check_vim_pathes!
        self.init_git_repo unless under_git?
        self.setup_pathogen unless File.exist?(self.pathogen_path)
        self.create_bundle_home unless File.exist?(self.bundle_home)
        self.init_bundle_file unless File.exists?(self.bundle_file_path)
      end

      def check_vim_pathes!
        %w[vim_home vimrc_path].each do |method_name|
          path = self.send(method_name)
          raise InitError.new("#{path} doesn't exist") unless File.exist?(path)
        end
      end

      def init_git_repo
        Dir.chdir(self.vim_home) do 
          message = <<-EOF
  your .vim folder is not a git repository.  we'll init git repository for you.

    You can make use of git submodule to manage your plugins.
    Futher more you can push your git repository to www.github.com.
          EOF
          STDOUT.puts message
          system("git init")
        end
      end

      def create_bundle_home 
        FileUtils.mkdir_p(bundle_home) 
        STDOUT.puts "create folder for pathogen in #{bundle_home}"
      end

      def setup_pathogen
        self.install_pathogen
        STDOUT.puts <<-EOF

  Pathogen is installed into #{self.pathogen_path}. 

  NOTICE: you need copy line below into #{self.vimrc_path}.

  call pathogen#runtime_append_all_bundles() 

        EOF
      end

      def install_pathogen
        FileUtils.mkdir_p(autoload_home) if !File.exist?(autoload_home)
        FileUtils.cp pathogen_vim_path, pathogen_path
      end

      def init_bundle_file
        FileUtils.cp bundle_template_file_path, bundle_file_path
        STDOUT.puts <<-EOF

  Writing new BundleFile to #{self.bundle_file_path}. 

  You can add more plugins by modify this file
        EOF
      end
    end 
  end
end
