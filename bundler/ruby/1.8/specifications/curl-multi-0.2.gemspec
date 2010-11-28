# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{curl-multi}
  s.version = "0.2"

  s.required_rubygems_version = nil if s.respond_to? :required_rubygems_version=
  s.authors = ["Kristjan Petursson", "Keith Rarick"]
  s.cert_chain = nil
  s.date = %q{2008-06-02}
  s.description = %q{Ruby bindings for the libcurl multi interface}
  s.email = %q{kr@essembly.com}
  s.extra_rdoc_files = ["History.txt", "License.txt", "Manifest.txt", "README.txt", "website/index.txt"]
  s.files = ["History.txt", "License.txt", "Manifest.txt", "README.txt", "Rakefile", "config/hoe.rb", "config/requirements.rb", "lib/curl-multi.rb", "lib/curl-multi/version.rb", "lib/uri-extensions.rb", "log/debug.log", "script/destroy", "script/generate", "script/txt2html", "setup.rb", "tasks/deployment.rake", "tasks/environment.rake", "tasks/website.rake", "test/test_curl-multi.rb", "test/test_helper.rb", "website/index.html", "website/index.txt", "website/javascripts/rounded_corners_lite.inc.js", "website/stylesheets/screen.css", "website/template.rhtml"]
  s.homepage = %q{http://curl-multi.rubyforge.org}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.required_ruby_version = Gem::Requirement.new("> 0.0.0")
  s.rubyforge_project = %q{curl-multi}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Ruby bindings for the libcurl multi interface}
  s.test_files = ["test/test_helper.rb", "test/test_curl-multi.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 1

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<RubyInline>, [">= 3.6.2"])
      s.add_runtime_dependency(%q<curb>, [">= 0.1.2"])
    else
      s.add_dependency(%q<RubyInline>, [">= 3.6.2"])
      s.add_dependency(%q<curb>, [">= 0.1.2"])
    end
  else
    s.add_dependency(%q<RubyInline>, [">= 3.6.2"])
    s.add_dependency(%q<curb>, [">= 0.1.2"])
  end
end
