require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'rdoc/task'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "fred"
    gem.summary = %Q{Ruby wrapper for the St. Louis Federal Reserve FRED API}
    gem.description = %Q{Ruby wrapper for the St. Louis Federal Reserve FRED API}
    gem.email = "johnnyn@gmail.com"
    gem.homepage = "http://github.com/phuphighter/fred"
    gem.authors = ["Johnny Khai Nguyen"]
    
    gem.add_runtime_dependency('httparty', '~> 0.5', '>= 0.5.0')
    gem.add_runtime_dependency('hashie', '~> 2.0', '>= 2.0.5')
    gem.version = File.read('VERSION').chomp
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the fred plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the fred plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Fred'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
