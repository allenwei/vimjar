# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "vim-jar/version"

Gem::Specification.new do |s|
  s.name        = "vim-jar"
  s.version     = Vim::Jar::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["allen wei"]
  s.email       = ["digruby@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/vim-jar"
  s.summary     = %q{The missing plugin manager for VIM}
  s.description = %q{}

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency('rspec')
  s.add_development_dependency('rr')
  s.add_development_dependency('fuubar')
  #s.add_development_dependency('fakefs')
  s.add_development_dependency('ruby-debug')

end
