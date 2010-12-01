Then /^I should get there is no \.vim folder error$/ do
  And "the stderr should contain \"doesn't exist\""
end

Then /^I should get there is no \.vimrc file error$/ do
  And "the stderr should contain \"doesn't exist\""
end

Then /^I should get \.vim is not a git repo error$/ do
  And "the stderr should contain \"your .vim folder is not a git repository\""
end

Then /^I should get install pathogen notice$/ do
  And "the stdout should contain \"Pathogen is installed into\""
end


