# encoding: utf-8

Gem::Specification.new do |gem|
  gem.name    = 'memdash-mongoid'
  gem.version = '0.1.0'

  gem.authors     = ['Brian Ryckbost']
  gem.email       = 'bryckbost@gmail.com'
  gem.description = 'A dashboard for your memcached, storing data in mongoid.'
  gem.summary     = 'A dashboard for your memcached, storing data in mongoid.'
  gem.homepage    = 'https://github.com/bryckbost/memdash'

  gem.add_dependency 'memdash', gem.version
  gem.add_dependency 'mongoid', '~> 2.4'

  gem.files         = `git ls-files lib`.split($\).grep(/(mongoid)/)
  gem.require_paths = ['lib']
end

