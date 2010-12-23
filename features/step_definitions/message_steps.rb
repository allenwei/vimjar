Then /^I should get there is no \.vim folder error$/ do
  And "the stderr should contain \"doesn't exist\""
end

Then /^I should get there is no \.vimrc file error$/ do
  And "the stderr should contain \"doesn't exist\""
end

Then /^I should get \.vim is not a git repo warning$/ do
  And "the stdout should contain \"your .vim folder is not a git repository\""
end

Then /^I should get install pathogen notice$/ do
  And "the stdout should contain \"Pathogen is installed into\""
end

Then /^I should get install command not correct error$/ do
  And %Q{the stderr should contain "was called incorrectly"}
end

Then /^I should get can not find plugin "([^"]*)"$/ do |plugin_name|
  message = "Can not find plugin '#{plugin_name}'"
  And %Q{the stderr should contain "#{message}"}
end

Then /^I should see more than one plugin$/ do
  And %Q{the stdout should contain "vim-rails"}
end
