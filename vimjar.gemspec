# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "vim-jar/version"

Gem::Specification.new do |s|
  s.name        = "vimjar"
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

  s.add_runtime_dependency('thor')

  s.add_development_dependency('rake')
  s.add_development_dependency('rspec')
  s.add_development_dependency('fuubar')
  s.add_development_dependency('aruba')
  s.add_development_dependency('debugger')
  s.add_development_dependency('cucumber')
  s.add_development_dependency('growl')
  s.add_development_dependency('rb-fsevent')
  s.add_development_dependency('guard-rspec', "~> 1.2.0")
  s.add_development_dependency('guard-cucumber', "~> 1.2.0")

end
