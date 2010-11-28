require 'spec_helper'

describe Vim::Jar::Plugin do 
  before(:each) do 
    stub(Vim::Jar::Plugin.config).yaml_path  { File.expand_path("./plugin_ymls/rails-vim.yml",File.dirname(__FILE__)) }
  end

  context ".plugins" do 
    it "should contain vim-rails in rails-vim.yml" do 
      Vim::Jar::Plugin.plugins.should include({"name" => "vim-rails", "desc" => "rails.vim: Ruby on Rails power tools", "url" => "git://github.com/tpope/vim-rails.git", "type" => "git", "homepage" => "https://github.com/tpope/vim-rails" })
    end
  end

  context ".exist" do 
    it "should be true if has plugin in @plugins" do 
     Vim::Jar::Plugin.plugins << {"name" => "test" } 
     Vim::Jar::Plugin.exist?("test").should be_true
     Vim::Jar::Plugin.exist?("TEST ").should be_true
    end

    it "should be true if there in no plugin in @plugins" do 
     Vim::Jar::Plugin.exist?("testasdasdasdasdas").should be_false
    end
  end

  context ".find" do 
    it "should find vim-rails in rails-vim.yml" do 
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
