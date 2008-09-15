Gem::Specification.new do |s| 
  s.name = "Rhyme" 
  s.version = "0.0.1" 
  s.author = "Diego Carrion" 
  s.email = "dc.rec1@gmail.com" 
  s.homepage = "http://www.mouseoverstudio.com/blog/" 
  s.platform = Gem::Platform::RUBY 
  s.summary = "A Java to Ruby objects translator" 
  candidates = Dir.glob("{doc,lib,tests}/**/*") 
  s.files = candidates.delete_if { |item| item.include?("rdoc") }
  s.require_path = "lib" 
  s.test_file = "test/test_rhyme.rb" 
  s.has_rdoc = true 
  s.extra_rdoc_files = ["README.txt"]
end