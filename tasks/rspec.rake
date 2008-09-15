require 'spec/rake/spectask'

desc "Run all specs"
Spec::Rake::SpecTask.new('specs') do |t|
  t.spec_files = FileList['test/**/*.rb']
end

desc "Run all specs with RCov"
Spec::Rake::SpecTask.new('coverage') do |t|
  t.spec_files = FileList['test/**/*.rb']
  t.rcov = true
  t.rcov_opts = ['--exclude', 'test']
end