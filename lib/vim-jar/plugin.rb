module Vim
  module Jar
    module Plugin
      autoload :Git, 'vim-jar/plugin/git.rb'

      def self.find(plugin_name)
        #TODO use sqlite in the future
        plugin_attrs = plugins.detect { |p| p["name"].to_s.downcase == plugin_name.to_s.downcase }
        build(plugin_attrs)
      end

      def self.plugins
        return @plugins if @plugins
        if !File.exist? config.yaml_path
          FileUtils.touch config.yaml_path
          @plugins = []
        else
          @plugins = YAML.load_file(config.yaml_path) || []
        end
        @plugins
      end

      def self.exist? name
        #OPTIMIZE
        @exist_list ||= {}
        return @exist_list[name] if @exist_list.has_key? name
        result            = self.plugins.any? { |p| p["name"].strip.downcase == name.strip.downcase }
        @exist_list[name] = result
        result
      end

      def self.insert(attrs)
        #OPTIMIZE
        if self.exist? attrs["name"]
          return false
        else
          self.plugins << attrs
          return true
        end
      end

      def self.installed
        @installed ||= Dir[config.bundle_home.join("*")].map { |bundle_path| File.basename(bundle_path) }
      end

      def self.uninstall(name)
        remove_ref_from_gitmodules(name)
        remove_ref_from_git_config(name)
        remove_from_cache(name)
      end

      def self.remove_from_cache(name)
        Dir.chdir(config.vim_home) do
          system("git rm --cached bundle/#{name}")
          FileUtils.rm_rf("bundle/#{name}")
        end
      end

      def self.remove_ref_from_gitmodules(name)
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

      def self.remove_ref_from_git_config(name)
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

      def self.reset
        self.instance_variable_set("@plugins", nil)
        self.plugins
      end

      def self.config
        ::Vim::Jar::Config.instance
      end

      def self.build(plugin_attrs)
        return nil unless plugin_attrs
        type = plugin_attrs["type"]
        case type
          when "git"
            ::Vim::Jar::Plugin::Git.new(plugin_attrs)
          else
            nil
        end
      end
    end
  end
end


