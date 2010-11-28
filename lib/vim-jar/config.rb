module Vim
  module Jar 
    class Config 
      require 'singleton'
      include Singleton
      
      def user_home 
        Pathname.new(::Gem.user_home)
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
    end 
  end
end
