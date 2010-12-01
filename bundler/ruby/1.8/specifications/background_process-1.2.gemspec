# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{background_process}
  s.version = "1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tim Harper"]
  s.date = %q{2010-04-28}
  s.description = %q{A library for spawning and interacting with UNIX processes}
  s.email = ["timcharper+bp@gmail.com"]
  s.extra_rdoc_files = ["MIT-LICENSE", "README.textile"]
  s.files = ["README.textile", "MIT-LICENSE", "lib/background_process/background_process.rb", "lib/background_process/io_helpers.rb", "lib/background_process/pty_background_process.rb", "lib/background_process.rb", "spec/background_process/background_process_spec.rb", "spec/background_process/io_helpers_spec.rb", "spec/background_process/pty_background_process_spec.rb", "spec/spec_helper.rb"]
  s.homepage = %q{http://github.com/timcharper/background_process}
  s.rdoc_options = ["--main", "README.textile"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{background_process}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{background_process}
  s.test_files = ["spec/background_process/background_process_spec.rb", "spec/background_process/io_helpers_spec.rb", "spec/background_process/pty_background_process_spec.rb", "spec/spec_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
