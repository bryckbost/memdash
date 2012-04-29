#!/usr/bin/env rake

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

ADAPTERS = %w(active_record)
ADAPTERS = %w(active_record mongo_mapper)

task :default => :test

desc 'Run tests'
task :test => ADAPTERS.map{|a| "#{a}:test" }

ADAPTERS.each do |adapter|
  namespace adapter do
    desc "Run tests against #{adapter}"
    RSpec::Core::RakeTask.new(:test => :env)

    task :env do
      ENV['ADAPTER'] = adapter
    end
  end
end
