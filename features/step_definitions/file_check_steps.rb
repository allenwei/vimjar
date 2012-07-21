Then /^It should install pathogen for me$/ do
  File.exist?(config.pathogen_path).should be_true
end

Then /^I should not see plugin "([^"]*)" in bundle home$/ do |plugin_name|
  File.exist?(config.bundle_home.join(plugin_name)).should be false
end

Then /^I should not see plugin "([^"]*)" in \.git\/config$/ do |plugin_name|
  File.read(config.gitmodules_file_path).should_not match /#{plugin_name}/
end

Then /^I should not see plugin "([^"]*)" in \.gitmodules$/ do |plugin_name|
  File.read(config.gitconfig_file_path).should_not match /#{plugin_name}/
end

Then /^I should have initial BundleFile$/ do
  File.exists?(config.bundle_file_path).should eq true
end

