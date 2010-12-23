Given /^There is not \.vim folder in user home\.$/ do
   FileUtils.rm_rf config.vim_home
end

Given /^There is not \.vimrc file in \.vim$/ do
  FileUtils.rm_rf config.vimrc_path
end

Given /^\.vim and \.vimrc$/ do
  FileUtils.mkdir_p config.vim_home
  FileUtils.touch config.vimrc_path
end


Given /^\.vim is not git repo$/ do
  FileUtils.rm_rf config.vim_home.join(".git")
end

Given /^\.vim is git repo$/ do
  FileUtils.mkdir_p config.vim_home
  Dir.chdir(config.vim_home) do 
    `git init > /dev/null`
  end
end

Given /^a full environment$/ do 
    Given ".vim and .vimrc"
    config.check
end


