require 'spec_helper' 

describe Vim::Jar::Importer::Github do 
  context ".extract" do 
    it "can extract infos from github page" do 
      page_source = File.read(File.join(File.dirname(__FILE__),"pages","vim-rails-github.html"))
      infos = Vim::Jar::Importer::Github.extract(page_source)
      expect = { "url" => "git://github.com/tpope/vim-rails.git", "desc" => "rails.vim: Ruby on Rails power tools", "type" => "git" }
      infos.should == expect
    end
  end
end
