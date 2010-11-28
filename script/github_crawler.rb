require File.expand_path("../lib/vim-jar.rb", File.dirname(__FILE__)) 
repo_urls = (101..110).map do |n|
  "https://github.com/vim-scripts/repositories?page=#{n.to_s}"
end

plugin_urls = []
CONCURRENY = 20
curl_repo = Curl::Multi.new
#curl_plugin = Curl::Multi.new

on_failure_repo = lambda do |ex|
  puts 'Failure.'
  puts ex
end

on_success_repo = lambda do |body|
  puts "finish "
  config = ::Vim::Jar::Config.instance
  body.scan(/<a href=\"(\/vim-scripts\/[\w-]+?)\">/).each do |path|
    puts "import plugin https://github.com#{path} into #{config.yaml_path}"
    url = "https://github.com#{path}"
    name_home_page = ::Vim::Jar::Importer.extract_from_url(url)
    if !::Vim::Jar::Plugin.exist? name_home_page["name"]
      other_info = ::Vim::Jar::Importer.extract_from_page_source(url)
      ::Vim::Jar::Plugin.insert name_home_page.merge!(other_info)
    end
  end
  File.open(config.yaml_path, "w+") do |f|
    f.puts ::Vim::Jar::Plugin.plugins.to_yaml
  end
  repo_urls.pop(CONCURRENY - curl_repo.requests.length).each do |url|
    c = Curl::Easy.new(url) do|curl|
      curl.on_body{|data| on_success_repo.call(data) }
      curl.on_success {|easy| puts "success, add more easy handles" }
    end

    curl_repo.add(c)

  end
end

repo_urls.pop(CONCURRENY).each do |url|
  c = Curl::Easy.new(url) do|curl|
    curl.on_body{|data| on_success_repo.call(data) }
    curl.on_success {|easy| puts "success, add more easy handles" }
  end
  
  curl_repo.add(c)
end

curl_repo.perform

#while curl_repo.size > 0 do 
  #sleep 0.5
#end 
#on_success_repo = lambda do |body|
#puts body
#end
#on_failure_repo = lambda do |ex|
#puts 'Failure.'
#puts ex
#end


#curl.get('http://www.example.org/', on_success, on_failure)
#curl.select([], []) while curl.size > 0

#url = URI.parse("https://github.com/vim-scripts/repositories")
#http = Net::HTTP.new(url.host, 443)
#http.use_ssl = true
#http.get(url.path) do |resp| 
#resp.scan(/<a href=\"(\/vim-scripts\/[\w-]+?)\">/).each do |path|
#::Vim::Jar::Importer::import("https://github.com#{path}")
#end
#end

