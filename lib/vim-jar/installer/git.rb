module Vim
  module Jar
    module Installer
      module Git
        def install_to(source, output_path)
          Dir.chdir(config.vim_home) do
            system("git submodule add #{source} #{Pathname.new(output_path).relative_path_from(config.vim_home)}")
            system("git submodule init")
          end
        end

        def config
          ::Vim::Jar::Config.instance
        end
      end
    end
  end
end


