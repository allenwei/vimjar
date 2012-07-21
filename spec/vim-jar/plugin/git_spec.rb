require 'spec_helper'

describe Vim::Jar::Plugin::Git do 

  let(:plugin) do
    Vim::Jar::Plugin::Git.new("git://github.com/tpope/vim-cucumber.git")
  end
  
  describe "initialize" do 
    it "raise exception if it's not github" do 
      lambda {
        Vim::Jar::Plugin::Git.new("git://something.com")
      }.should raise_error Vim::Jar::InstallError
    end

    it "raise exception if it is not end with .git" do 
      lambda {
        Vim::Jar::Plugin::Git.new("git://github.com/abc")
      }.should raise_error Vim::Jar::InstallError
    end

    it "can parse repo name" do 
      p = Vim::Jar::Plugin::Git.new("git://github.com/tpope/vim-cucumber.git")
      p.name.should eq "vim-cucumber"
    end
  end
  
  describe "#install" do 
    it "should call install_to" do 
      plugin.should_receive(:install_to).with(plugin.url, plugin.target_path)
      plugin.install
    end
  end

  describe "#uninstall" do 
    it "should call uninstall_for" do 
      plugin.should_receive(:uninstall_for).with(plugin.name)
      plugin.uninstall
    end
  end
end
