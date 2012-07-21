require 'spec_helper'

describe Vim::Jar::Plugin do 
  context ".update" do 
    it "should run command 'git submodule update'" do 
      Vim::Jar::Plugin.should_receive(:system).with("git submodule update")
      Vim::Jar::Plugin.update
    end
  end

end
