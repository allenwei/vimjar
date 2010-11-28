module Vim
  module Jar 
    module Plugin
      autoload :Git, 'vim-jar/plugin/git.rb'

      def self.find(plugin_name)  
        #TODO use sqlite in the future
        plugin_attrs = plugins.detect{|p| p["name"].to_s.downcase == plugin_name.to_s.downcase } 
        build(plugin_attrs)
      end

      def self.plugins
        @plugins ||= YAML.load_file(config.yaml_path)
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


