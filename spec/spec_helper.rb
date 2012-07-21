require 'rubygems'
require 'bundler/setup'
require 'rspec'
require 'FileUtils'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__),'..','lib'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__),'formulars'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

ENV['VIM_JAR_USER_HOME'] = File.expand_path("../../tmp", __FILE__)

require 'vim-jar'
#require 'fakefs/spec_helpers'

RSpec.configure do |config|
  #config.include FakeFS::SpecHelpers
  config.before(:each) do 
    FileUtils.rm_rf ENV["VIM_JAR_USER_HOME"]    
    FileUtils.mkdir_p ENV["VIM_JAR_USER_HOME"]    
    FileUtils.touch File.join(ENV["VIM_JAR_USER_HOME"], ".vimrc")
    FileUtils.mkdir_p File.join(ENV["VIM_JAR_USER_HOME"], ".vim")
  end
end

