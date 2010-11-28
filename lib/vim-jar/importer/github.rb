module Vim
  module Jar 
    module Importer
      class Github
        def self.extract(page_source)  
          infos = {
            "url" => page_source[/<a href=\"(git:\/\/github\.com\/.+?)\".*>/,1],
            "desc" => page_source[/<p>(.+?)\s+<span id=\"read_more\"/,1], 
            "type" => "git"
          } 
        end
      end
    end
  end
end



