desc 'Run the entire test suite'
task :test do
  ENV['RACK_ENV'] = 'test'

  require 'rspec/core/rake_task'
  require 'cucumber/rake/task'

  Cucumber::Rake::Task.new(:features)
  Rake::Task[:features].invoke

  RSpec::Core::RakeTask.new(:spec)
  Rake::Task[:spec].invoke
end
