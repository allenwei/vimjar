require 'spec_helper'

describe Vim::Jar::Config do 
  let(:config) { Vim::Jar::Config.instance }

  context ".user_home" do 
    it "should return user home dir" do 
      config.user_home.to_s.should == ENV["VIM_JAR_USER_HOME"]
    end
  end

  context ".vim_home" do 
    it "should in user_home/.vim by default" do 
      config.vim_home.to_s.should == config.user_home.join(".vim").to_s
    end
  end

  context ".vimrc_path" do 
    it "should in user_home/.vimrc by default" do 
      config.vimrc_path.to_s.should == config.user_home.join(".vimrc").to_s
    end
  end

  context ".under_git" do 
    before do 
      config.should_receive(:vim_home).and_return(Pathname.new("."))
    end

    it "should be true if has .git in vim_home" do 
      File.should_receive(:exist?).with(any_args).and_return(true)
      config.instance_variable_set("@under_git", nil)
      config.under_git?.should be_true
    end

    it "should be false if no .git in vim_home" do 
      File.should_receive(:exist?).with(any_args).and_return(false)
      config.instance_variable_set("@under_git", nil)
      config.under_git?.should be_false
    end
  end

  context ".bundle_home" do 
    it "should be in .vim/bundle" do 
      path = Pathname.new(".")
      config.should_receive(:vim_home).and_return(path)
      config.bundle_home.to_s.should == path.join("bundle").to_s
    end
  end

  context ".gitmodules_file_path" do 
    it "should be in .vim/.gitmodules" do 
      path = Pathname.new(".")
      config.should_receive(:vim_home).and_return(path)

      config.gitmodules_file_path.to_s.should == path.join(".gitmodules").to_s
    end
  end

  context ".gitconfig_file_path" do
    it "should be in .vim/.git/config" do
      path = Pathname.new(".")
      config.should_receive(:vim_home).and_return(path)
      config.gitconfig_file_path.to_s.should == path.join(".git/config").to_s
    end
  end

  context ".bundle_file_path" do 
    it "should be in .vim/BundleFile" do 
      path = Pathname.new(".")
      config.should_receive(:vim_home).and_return(path)
      config.bundle_file_path.to_s.should == path.join("BundleFile").to_s
    end
  end

  context ".bundle_template_file_path" do 
    it "should be in lib/templates/BundleFile" do 
      config.bundle_template_file_path.should eq config.vim_jar_lib.join("templates", "BundleFile")
    end
  end


  context ".check" do 
    it "should raise exception if folder check not pass" do 
      config.should_receive(:check_vim_pathes!).and_raise(Vim::Jar::InitError.new)
      lambda {config.check}.should raise_error Vim::Jar::InitError
    end

    it "should call init_git_repo, setup_pathogen and create_bundle_home" do 
      config.should_receive(:check_vim_pathes!) 
      config.should_receive(:under_git?).and_return(false)
      config.should_receive(:init_git_repo) 
      config.should_receive(:setup_pathogen) 
      config.should_receive(:create_bundle_home) 
      config.should_receive(:init_bundle_file) 
      config.check
    end
  end

  context ".init_git_repo" do 
    it "should do system call for 'git init'" do 
      config.init_git_repo
      File.exist? config.vim_home.join(".git")
    end
  end

  context ".setup_pathogen" do 
    it "call install_pathogen" do 
      config.setup_pathogen
      File.exist? config.vim_home.join(".git")
    end
  end

  context ".create_bundle_home" do 
    it "should mkdir at bundle_home" do
      config.create_bundle_home
      File.exist? config.bundle_home
    end
  end

  context ".init_bundle_file" do 
    it "should copy BundleFile template" do 
      config.init_bundle_file
      File.read(config.bundle_file_path).should eq File.read(config.bundle_template_file_path)
    end
  end
end
