# A sample Guardfile
# More info at http://github.com/guard/guard#readme

notification :growl

guard 'rspec', :version => 2, :all_on_start => false, :all_after_pass => false, :cli => "--color --format nested", :bundler => true  do
  watch(%r{^spec/.*_spec\.rb$})
  watch(%r{^lib/(.*)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^controllers/(.+)\.rb$})     { |m| "spec/integration/#{m[1]}_spec.rb" }
  watch(%r{^models/(.+)\.rb$})     { |m| "spec/models/#{m[1]}_spec.rb" }
  watch(%r{^spec/factories.rb$})     { |m| "spec/factories_spec.rb" }
  watch(%r{^spec/factories/*.rb$})     { |m| "spec/factories_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }
end


guard 'cucumber', :all_on_start => false, :notification => false do
  watch(%r{features/.+\.feature})
  #watch(%r{features/support/.+})                      { 'features' }
  #watch(%r{features/step_definitions/(.+)_steps\.rb}) { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'features' }
end
