Then /^I should get there is no \.vim folder error$/ do
  step "the stderr should contain \"doesn't exist\""
end

Then /^I should get there is no \.vimrc file error$/ do
  step "the stderr should contain \"doesn't exist\""
end

Then /^I should get \.vim is not a git repo warning$/ do
  step "the stdout should contain \"your .vim folder is not a git repository\""
end

Then /^I should get install pathogen notice$/ do
  step "the stdout should contain \"Pathogen is installed into\""
end

Then /^I should see more than one plugin$/ do
  step %Q{the stdout should contain "vim-rails"}
end

Then /^It should get get BundleFile notice$/ do
  step %Q{the stdout should contain "You add more plugins by modify this file"}
end
