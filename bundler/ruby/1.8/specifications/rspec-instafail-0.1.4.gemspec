# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rspec-instafail}
  s.version = "0.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Michael Grosser"]
  s.date = %q{2010-11-17}
  s.email = %q{grosser.michael@gmail.com}
  s.files = ["Rakefile", "Readme.md", "VERSION", "lib/rspec/instafail.rb", "lib/rspec/instafail/rspec_1.rb", "lib/rspec/instafail/rspec_2.rb", "rspec-instafail.gemspec", "spec/instafail_spec.rb", "spec/rspec_1/Gemfile", "spec/rspec_1/Gemfile.lock", "spec/rspec_1/a_test.rb", "spec/rspec_2/Gemfile", "spec/rspec_2/Gemfile.lock", "spec/rspec_2/a_test.rb"]
  s.homepage = %q{http://github.com/grosser/rspec-instafail}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Show failing specs instantly}
  s.test_files = ["spec/rspec_1/a_test.rb", "spec/rspec_2/a_test.rb", "spec/instafail_spec.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
