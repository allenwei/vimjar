require 'spec_helper' 

describe Vim::Jar do 
  context ".config" do 
    it "should init config instance" do 
      config = Vim::Jar.config 
      config.should be_instance_of Vim::Jar::Config
    end

    it "should cache config instance" do 
      config = Vim::Jar.config 
      Vim::Jar.config.should equal config
    end
  end

end

