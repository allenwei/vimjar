
ENV['VIM_JAR_USER_HOME'] = File.expand_path("../../tmp",File.dirname(__FILE__))
require 'fileutils'
require 'aruba'
require 'rr'
require File.expand_path('../../lib/vim-jar', File.dirname(__FILE__))
require File.expand_path('../../lib/vim-jar/cli', File.dirname(__FILE__))

FileUtils.mkdir_p ENV['VIM_JAR_USER_HOME']
module Vim::Jar::World 
  def config 
    ::Vim::Jar::Config.instance
  end

  def bin_path
    File.expand_path('../../bin/vim-jar', File.dirname(__FILE__))
  end
end

World(Vim::Jar::World)
