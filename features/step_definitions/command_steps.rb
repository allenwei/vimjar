When /^I run command "([^"]*)"$/ do |command|
  @aruba_io_wait_seconds = 20
  step "I run `bundle exec #{bin_path} #{command}`"
end

When /^I successfully run command "([^"]*)"$/ do |command|
  step "I successfully run `bundle exec #{bin_path} #{command}`"
end

  

Then /^I should see "([^"]*)" in installed list$/ do |plugin_name|
  step "I run command \"installed\"" 
  step %Q{the stdout should contain "#{plugin_name}"}
end


Then /^I should see update success message$/ do |plugin_name|
  step %Q{the stdout should contain "All your plugin is up to date."}
end

