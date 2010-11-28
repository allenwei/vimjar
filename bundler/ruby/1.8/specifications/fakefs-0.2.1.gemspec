# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{fakefs}
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Chris Wanstrath"]
  s.date = %q{2009-10-30}
  s.description = %q{A fake filesystem. Use it in your tests.}
  s.email = %q{chris@ozmm.org}
  s.extra_rdoc_files = ["LICENSE", "README.markdown"]
  s.files = [".gitignore", "CONTRIBUTORS", "LICENSE", "README.markdown", "Rakefile", "lib/fakefs.rb", "lib/fakefs/base.rb", "lib/fakefs/dir.rb", "lib/fakefs/fake/dir.rb", "lib/fakefs/fake/file.rb", "lib/fakefs/fake/symlink.rb", "lib/fakefs/file.rb", "lib/fakefs/file_system.rb", "lib/fakefs/fileutils.rb", "lib/fakefs/safe.rb", "lib/fakefs/spec_helpers.rb", "lib/fakefs/version.rb", "spec/fakefs/spec_helpers_spec.rb", "spec/spec.opts", "spec/spec_helper.rb", "test/fake/file_test.rb", "test/fake/symlink_test.rb", "test/fakefs_test.rb", "test/file/stat_test.rb", "test/safe_test.rb", "test/verify.rb"]
  s.homepage = %q{http://github.com/defunkt/fakefs}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A fake filesystem. Use it in your tests.}
  s.test_files = ["spec/fakefs/spec_helpers_spec.rb", "spec/spec_helper.rb", "test/fake/file_test.rb", "test/fake/symlink_test.rb", "test/fakefs_test.rb", "test/file/stat_test.rb", "test/safe_test.rb", "test/verify.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
