Then /^It should install "([^"]*)"$/ do |plugin_name| 
  File.exist?(config.bundle_home.join(plugin_name)).should be true
end

