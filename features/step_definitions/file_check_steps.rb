Then /^It should install pathogen for me$/ do
  File.exist?(config.pathogen_path).should be_true
end
