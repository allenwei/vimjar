require 'spec_helper' 

describe Vim::Jar::Importer do 

  context "import" do 
    it "should append plugin info into plugins.yml" do 
      yaml_path = File.expand_path("./plugin_ymls/blank.yml", File.dirname(__FILE__))
      FileUtils.rm_f yaml_path
      infos_part1 = { "url" => "git://github.com/tpope/vim-rails.git", "desc" => "rails.vim: Ruby on Rails power tools", "type" => "git"}
      infos_part2 = {"homepage" => "https://github.com/tpope/vim-rails", "name" => "vim-rails"}
      homepage = infos_part2["homepage"]
      stub(Vim::Jar::Importer.config).yaml_path  { yaml_path }
      mock(Vim::Jar::Importer).extract_from_page_source(homepage) { infos_part1 }
      mock(Vim::Jar::Importer).extract_from_url(homepage) { infos_part2 }
      Vim::Jar::Importer.import(homepage)
      YAML.load_file(yaml_path).should include infos_part1.merge!(infos_part2)
    end

    it "should raise ImportError if plugin already exist" do 
      plugin_name = "test_plugin"
      mock(Vim::Jar::Importer).extract_from_url(anything) { {"name" => plugin_name} }
      mock(::Vim::Jar::Plugin).exist?(plugin_name) { true }
      lambda { ::Vim::Jar::Importer.import("an url")}.should raise_error ::Vim::Jar::ImportError
    end
  end

  context ".extract" do 
    it "should extract infos include :homepage, :url, :desc, :name" do 
      infos = { "url" => "git://github.com/tpope/vim-rails.git", "desc" => "rails.vim: Ruby on Rails power tools" }
      url = "https://github.com/tpope/vim-rails"
      page_source = File.read(File.join(File.dirname(__FILE__), 'importer', "pages","vim-rails-github.html"))
      mock(Vim::Jar::Importer::Github).extract(page_source) { infos } 
      mock(Vim::Jar::Importer).is_github?(url) { true }
      mock(Vim::Jar::Importer).get_page_source(url) { page_source }
      Vim::Jar::Importer.extract_from_page_source(url).should == infos
    end
  end

  context ".is_github?" do 
    it "should be true if url is 'https://github.com/tpope/vim-rails'"  do 
      Vim::Jar::Importer.is_github?("https://github.com/tpope/vim-rails").should be_true
    end

    it "should be false if url is 'http://google.com'"  do 
      Vim::Jar::Importer.is_github?('http://google.com').should be_false
    end
  end

  context ".get_page_source" do 
    it "should get currect file" do 
      ##TODO write integration test instead
      #page_source = Vim::Jar::Importer.get_page_source('https://github.com/tpope/vim-rails')
      #page_source.should include "vim-rails"
      #page_source.should include "script_id=1567"
      #page_source.should include "tpope"
    end
  end
end
