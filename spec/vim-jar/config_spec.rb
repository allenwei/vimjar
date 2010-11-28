require 'spec_helper'

describe Vim::Jar::Config do 
  let(:config) { Vim::Jar::Config.instance }

  context ".user_home" do 
    it "should return user home dir" do 
      config.user_home.to_s.should == Gem.user_home
    end
  end

  context ".vim_home" do 
    it "should in user_home/.vim by default" do 
      user_home = Pathname.new(Gem.user_home)
      config.vim_home.to_s.should == user_home.join(".vim").to_s
    end
  end

  context ".vimrc_path" do 
    it "should in user_home/.vimrc by default" do 
      user_home = Pathname.new(Gem.user_home)
      config.vimrc_path.to_s.should == user_home.join(".vimrc").to_s
    end
  end

  context ".under_git" do 
    before do 
      mock(config).vim_home { Pathname.new(".") }
    end

    it "should be true if has .git in vim_home" do 
      mock(File).exist?(anything) { true }
      config.instance_variable_set("@under_git", nil)
      config.under_git?.should be_true
    end

    it "should be false if no .git in vim_home" do 
      mock(File).exist?(anything) { false }
      config.instance_variable_set("@under_git", nil)
      config.under_git?.should be_false
    end
  end

  context ".bundle_home" do 
    it "should be in .vim/bundle" do 
      path = Pathname.new(".")
      mock(config).vim_home { path }
      config.bundle_home.to_s.should == path.join("bundle").to_s
    end
  end

  context ".check" do 
    it "should raise exception if folder check not pass" do 
      mock(File).exist?(anything) { false }
      lambda {config.check}.should raise_error Vim::Jar::InitError
    end

    it "should raise exception if .vim is not under git source controller" do 
      stub(File).exist?(anything) { true }
      mock(config).under_git? { false }
      lambda {config.check}.should raise_error Vim::Jar::InitError
    end
  end

  context ".yaml_path" do 
    it "should be lib/vim-jar/plugins.yml" do 
      config.yaml_path.should == File.expand_path("../../lib/vim-jar/plugins.yml",File.dirname(__FILE__))
    end
  end
end
