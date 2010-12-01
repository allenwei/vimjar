After do
  FileUtils.rm_rf(File.expand_path("../../tmp",File.dirname(__FILE__)))
end

at_exit do
  FileUtils.rm_rf(File.expand_path("../../tmp",File.dirname(__FILE__)))
end

