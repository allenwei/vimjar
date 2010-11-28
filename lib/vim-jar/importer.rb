module Vim
  module Jar 
    module Importer
      autoload :Github, 'vim-jar/importer/github'
      def self.import(url)  
        name_home_page = self.extract_from_url(url)
        if !::Vim::Jar::Plugin.exist? name_home_page["name"]
          other_info = self.extract_from_page_source(url)
          ::Vim::Jar::Plugin.insert name_home_page.merge!(other_info)
          File.open(config.yaml_path, "w+") do |f|
            f.puts ::Vim::Jar::Plugin.plugins.to_yaml
          end
        else
          raise ::Vim::Jar::ImportError.new("plugin #{name_home_page["name"]} exist")
        end
      end

      def self.extract_from_url(url) 
        {"homepage" => url, "name" => url.split("/").last}
      end

      def self.extract_from_page_source(url)
        page_source = get_page_source(url)
        if is_github?(url)
          return Github.extract(page_source)
        else 
          raise ::Vim::Jar::ImportError.new("Do not support import from #{url}")
        end
      end

      def self.is_github?(url)
        return !!(url =~ /github\.com/ )
      end

      def self.get_page_source(url) 
        url = URI.parse(url)
        http = Net::HTTP.new(url.host, 443)
        http.use_ssl = true
        http.get(url.path) do |resp| 
          return resp
        end
      end

      def self.config 
        ::Vim::Jar::Config.instance
      end


    end
  end
end



