# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{aruba}
  s.version = "0.2.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Aslak Helles\303\270y", "David Chelimsky", "Mike Sassak"]
  s.date = %q{2010-11-13}
  s.description = %q{CLI Steps for Cucumber, hand-crafted for you in Aruba}
  s.email = %q{cukes@googlegroups.com}
  s.extra_rdoc_files = ["LICENSE", "README.rdoc", "History.txt"]
  s.files = [".bundle/config", ".document", ".gitignore", ".rvmrc", "Gemfile", "History.txt", "LICENSE", "README.rdoc", "Rakefile", "aruba.gemspec", "config/.gitignore", "cucumber.yml", "features/exit_statuses.feature", "features/file_system_commands.feature", "features/flushing.feature", "features/interactive.feature", "features/output.feature", "features/step_definitions/aruba_dev_steps.rb", "features/support/env.rb", "lib/aruba.rb", "lib/aruba/api.rb", "lib/aruba/cucumber.rb", "lib/aruba/process.rb"]
  s.homepage = %q{http://github.com/aslakhellesoy/aruba}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{aruba-0.2.6}
  s.test_files = ["features/exit_statuses.feature", "features/file_system_commands.feature", "features/flushing.feature", "features/interactive.feature", "features/output.feature", "features/step_definitions/aruba_dev_steps.rb", "features/support/env.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<cucumber>, ["~> 0.9.4"])
      s.add_runtime_dependency(%q<background_process>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.0.1"])
    else
      s.add_dependency(%q<cucumber>, ["~> 0.9.4"])
      s.add_dependency(%q<background_process>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.0.1"])
    end
  else
    s.add_dependency(%q<cucumber>, ["~> 0.9.4"])
    s.add_dependency(%q<background_process>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.0.1"])
  end
end
