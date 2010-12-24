When /^I run command "([^"]*)"$/ do |command|
  When "I run \"export VIM_JAR_TEST=true; bundle exec #{bin_path} #{command}\""
end

Then /^I should see "([^"]*)" in installed list$/ do |plugin_name|
  When "I run command \"installed\"" 
  Then %Q{the stdout should contain "#{plugin_name}"}
end


Then /^I should see update success message$/ do |plugin_name|
  Then %Q{the stdout should contain "All your plugin is up to date."}
end

