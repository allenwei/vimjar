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
        return @plugins if @plugins
        if !File.exist? config.yaml_path
          FileUtils.touch config.yaml_path
          @plugins = []
        else 
         @plugins = YAML.load_file(config.yaml_path)  || []
        end
        @plugins
      end

      def self.exist? name 
        #OPTIMIZE
        @exist_list ||= {}
        return @exist_list[name] if @exist_list.has_key? name
        result = self.plugins.any? {|p| p["name"].strip.downcase == name.strip.downcase} 
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


