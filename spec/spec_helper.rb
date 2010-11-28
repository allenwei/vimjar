require 'rubygems'
require 'bundler/setup'
require 'rspec'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__),'..','lib'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__),'formulars'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'vim-jar'
#require 'fakefs/spec_helpers'

RSpec.configure do |config|
  config.mock_with :rr
  #config.include FakeFS::SpecHelpers
  
  def app_root
    Pathname.new(File.join(__FILE__, "..", "tmp", ".vimmer"))
  end
end


