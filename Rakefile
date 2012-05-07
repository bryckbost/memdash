#!/usr/bin/env rake

require 'bundler/gem_helper'
require 'rspec/core/rake_task'

Bundler::GemHelper.install_tasks(:name => 'memdash')
Bundler::GemHelper.install_tasks(:name => 'memdash-activerecord')
Bundler::GemHelper.install_tasks(:name => 'memdash-mongo_mapper')
Bundler::GemHelper.install_tasks(:name => 'memdash-mongoid')

ADAPTERS = %w(active_record mongo_mapper mongoid)

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
