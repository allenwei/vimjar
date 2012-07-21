module Vim
  module Jar
    class Loader 

      def execute
        self.instance_eval read_bundle_file
      end

      def read_bundle_file
        if File.exist? config.bundle_file_path
          File.read config.bundle_file_path
        else
          raise Vim::Jar::InstallError.new("Can not find BundleFile in #{config.bundle_file_path}")
        end
      end

      def plugin(repo_url, args={}) 
        p = Plugin::Git.new(repo_url)
        p.install
      end

      def theme(repo_url, args={})

      end

      def config
        ::Vim::Jar::Config.instance
      end

    end
  end
end
