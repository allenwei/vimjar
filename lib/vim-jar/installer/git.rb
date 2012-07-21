module Vim
  module Jar
    module Installer
      module Git
        extend self

        def install_to(source, output_path)
          Dir.chdir(config.vim_home) do
            system("git submodule add #{source} #{Pathname.new(output_path).relative_path_from(config.vim_home)}")
            system("git submodule init")
          end
        end

        def uninstall_for(name)
          remove_ref_from_gitmodules(name)
          remove_ref_from_git_config(name)
          remove_from_cache(name)
        end

        def remove_from_cache(name)
          Dir.chdir(config.vim_home) do
            system("git rm -r --cached bundle/#{name}")
          end
        end

        def remove_ref_from_gitmodules(name)
          #TODO bundle name is different to submodule name
          f     = File.new(config.gitmodules_file_path)
          lines = f.lines.to_a
          lines.delete_if do |x|
            x =~ /bundle\/#{name}/ || x =~ /#{name}\.git$/
          end
          f.close

          File.open(config.gitmodules_file_path, "w") do |ff|
            lines.each do |l|
              ff.puts l
            end
          end
        end

        def remove_ref_from_git_config(name)
          #TODO bundle name is different to submodule name
          f     = File.new(config.gitconfig_file_path)
          lines = f.lines.to_a
          lines.delete_if do |x|
            x =~ /bundle\/#{name}/ || x =~ /#{name}\.git$/
          end
          f.close

          File.open(config.gitconfig_file_path, "w") do |ff|
            lines.each do |l|
              ff.puts l
            end
          end
        end

        def config
          ::Vim::Jar::Config.instance
        end
      end
    end
  end
end


