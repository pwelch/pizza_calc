
require 'rake/testtask'
require 'rubocop/rake_task'

Rake::TestTask.new do |t|
  t.libs       = ['lib']
  t.warning    = true
  t.verbose    = true
  t.test_files = FileList['test/*_test.rb']
end

RuboCop::RakeTask.new

namespace :security do
  desc 'Run bundler-audit'
  task :bundle_audit do
    sh 'bundle exec bundle-audit'
  end

  desc 'Update bundler-audit ruby-advisory-db'
  task :bundle_audit_update do
    sh 'bundle exec bundle-audit update'
  end
end

namespace :ci do
  desc 'Run Travis-CI Config Lint'
  task :lint do
    sh 'travis lint'
  end
end

task default: %i[test rubocop]
