require 'spec_helper'

describe Vim::Jar::Loader do 
  let(:loader) { Vim::Jar::Loader.new }
  context "#execute" do 
    it "should handle plugin" do 
      loader.should_receive(:read_bundle_file).and_return <<-EOF
plugin "git://github.com/tpope/vim-fugitive.git"
      EOF
      loader.should_receive(:plugin).with("git://github.com/tpope/vim-fugitive.git")
      loader.execute
    end

    it "should handle theme" do 
      loader.should_receive(:read_bundle_file).and_return <<-EOF
theme "git://github.com/gilesbowkett/ir_black.git"
      EOF
      loader.should_receive(:theme).with("git://github.com/gilesbowkett/ir_black.git")
      loader.execute
    end
  end

  context "#plugin" do 
    it "should build plugin and install" do 
      Vim::Jar::Plugin::Git.any_instance.should_receive(:install)
      loader.plugin("git://github.com/tpope/vim-fugitive.git")
    end 
  end
  
  context "#read_bundle_file" do 
    it "should read file from bundle_file_path" do
      loader.config.init_bundle_file
      loader.read_bundle_file.should eq File.read(loader.config.bundle_file_path)
    end
    
    it "should raise InstallError if BundleFile is not exist" do 
      File.should_receive(:exist?).with(loader.config.bundle_file_path).and_return(false)
      lambda {
        loader.read_bundle_file
      }.should raise_error Vim::Jar::InstallError
    end
  end
end
