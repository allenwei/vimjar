When /^I run command "([^"]*)"$/ do |arg1|
  When "I run \"export VIM_JAR_TEST=true; bundle exec #{bin_path} init\""
end



