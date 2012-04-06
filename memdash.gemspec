# encoding: utf-8

Gem::Specification.new do |gem|
  gem.name    = 'memdash'
  gem.version = '0.0.1'

  gem.authors     = ['Brian Ryckbost', 'Steve Richert']
  gem.email       = ['bryckbost@gmail.com', 'steve.richert@gmail.com']
  gem.description = 'A dashboard for your memcache'
  gem.summary     = 'A dashboard for your memcache'
  gem.homepage    = 'https://github.com/bryckbost/memdash'

  gem.add_dependency 'dalli', '~> 2.0'

  gem.add_development_dependency 'rake', '>= 0.8.7'
  gem.add_development_dependency 'rspec', '~> 2.0'

  gem.files         = `git ls-files`.split($\)
  gem.test_files    = gem.files.grep(/^spec\//)
  gem.require_paths = ['lib']
end
