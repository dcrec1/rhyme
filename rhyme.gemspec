Gem::Specification.new do |s| 
  s.name = "rhyme" 
  s.version = "0.0.1" 
  s.author = "Diego Carrion" 
  s.email = "dc.rec1@gmail.com" 
  s.homepage = "http://www.mouseoverstudio.com/blog/" 
  s.platform = Gem::Platform::RUBY 
  s.summary = "A Java to Ruby objects translator" 
  s.files = ["lib/rhyme.rb",
             "lib/rhyme/version.rb"]
  s.require_path = "lib" 
  s.test_file = "test/test_rhyme.rb" 
  s.has_rdoc = true 
  s.extra_rdoc_files = ["README.txt"]
end