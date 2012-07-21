require 'spec_helper'

describe Vim::Jar::Installer::Git do 

  context "#uninstall_for" do 
    context ".remove_ref_from_gitmodules" do 
      before(:each) do 
        @gitmodules_file_path = File.expand_path(".././gitmodules", File.dirname(__FILE__))
        @old_str = File.read @gitmodules_file_path
        Vim::Jar::Plugin.config.stub(:gitmodules_file_path => @gitmodules_file_path)
      end

      after(:each) do 
        File.open(@gitmodules_file_path,"w+") do |f|
          f.puts @old_str
        end
      end

      it "should remove lines include plugin name" do 
        Vim::Jar::Installer::Git.remove_ref_from_gitmodules("vim-cucumber")
        new_str = File.read @gitmodules_file_path 
        new_str.split("\n").should have(3).items
      end
    end


    context ".remove_ref_from_gitmodules" do
      before(:each) do
        @gitconfig_file_path = File.expand_path(".././git-config", File.dirname(__FILE__))
        @old_str = File.read @gitconfig_file_path
        Vim::Jar::Plugin.config.stub(:gitconfig_file_path => @gitconfig_file_path)
      end

      after(:each) do
        File.open(@gitconfig_file_path, "w+") do |f|
          f.puts @old_str
        end
      end

      it "should remove lines include plugin name" do
        Vim::Jar::Installer::Git.remove_ref_from_git_config("vim-rails")
        new_str = File.read @gitconfig_file_path
        new_str.should match /\[core\]/
          new_str.should match /\[remote \"origin\"\]/
        new_str.should match /\[branch \"master\"\]/
        new_str.should match /\[submodule \"bundle\/VimClojure\"\]/
        new_str.should_not match /vim-rails/
      end
    end
  end
end
