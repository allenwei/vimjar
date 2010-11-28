require 'spec_helper'

describe Vim::Jar::Plugin do 
  before(:each) do 
    stub(Vim::Jar::Plugin.config).yaml_path  { File.expand_path("./plugins.yaml",File.dirname(__FILE__)) }
  end
  context ".plugins" do 
    it "should contain vim-rails in plugins.yaml" do 
      Vim::Jar::Plugin.plugins.should include({"name" => "vim-rails", "desc" => "Ruby on Rails, easy file navigation, enhanced syntax highlighting, and more", "url" => "git://github.com/tpope/vim-rails.git", "type" => "git"})
    end
  end

  context ".find" do 
    it "should find vim-rails in plugins.yaml" do 
      Vim::Jar::Plugin.find("vim-rails").should_not be_nil
      Vim::Jar::Plugin.find("abcde").should be_nil
    end

    it "should find vim-rails in plugins.yaml and create a GitPlugin instance" do 
      plugin = Vim::Jar::Plugin.find("vim-rails")
      plugin.should be_kind_of(Vim::Jar::Plugin::Git) 
      plugin.name.should == "vim-rails"
      plugin.url.should == "git://github.com/tpope/vim-rails.git"
    end
  end
end
