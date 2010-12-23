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

  context ".gitmodules_file_path" do 
    it "should be in .vim/.gitmodules" do 
      path = Pathname.new(".")
      mock(config).vim_home { path }
      config.gitmodules_file_path.to_s.should == path.join(".gitmodules").to_s
    end
  end

  context ".gitconfig_file_path" do
    it "should be in .vim/.git/config" do
      path = Pathname.new(".")
      mock(config).vim_home  { path }
      config.gitconfig_file_path.to_s.should == path.join(".git/config").to_s
    end
  end


  context ".check" do 
    it "should raise exception if folder check not pass" do 
      mock(config).check_vim_pathes! { raise Vim::Jar::InitError.new }
      lambda {config.check}.should raise_error Vim::Jar::InitError
    end

    it "should call init_git_repo, setup_pathogen and create_bundle_home" do 
      mock(config).check_vim_pathes! { }
      mock(config).under_git? { false }
      mock(config).has_pathgen? { false }
      mock(config).has_bundle_home? { false }
      mock(config).init_git_repo
      mock(config).setup_pathogen
      mock(config).create_bundle_home
      config.check
    end
  end

  context ".init_git_repo" do 
    it "should do system call for 'git init'" do 
      mock(config).system("git init")
      mock(STDOUT).puts(anything) 
      config.init_git_repo
    end
  end

  context ".setup_pathogen" do 
    it "call install_pathogen" do 
      mock(config).install_pathogen
      mock(STDOUT).puts(anything) 
      config.setup_pathogen
    end
  end

  context ".create_bundle_home" do 
    it "should mkdir at bundle_home" do
      mock(FileUtils).mkdir_p(config.bundle_home) 
      mock(STDOUT).puts(anything) 
      config.create_bundle_home
    end
  end

  context ".yaml_path" do 
    it "should be lib/vim-jar/plugins.yml" do 
      config.yaml_path.should == File.expand_path("../../lib/vim-jar/plugins.yml",File.dirname(__FILE__))
    end
  end
end
