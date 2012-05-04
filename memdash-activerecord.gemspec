# encoding: utf-8

Gem::Specification.new do |gem|
  gem.name    = 'memdash-activerecord'
  gem.version = '0.1.0'

  gem.authors     = ['Brian Ryckbost', 'Steve Richert']
  gem.email       = 'bryckbost@gmail.com'
  gem.description = 'A dashboard for your memcached, storing data in ActiveRecord.'
  gem.summary     = 'A dashboard for your memcached, storing data in ActiveRecord.'
  gem.homepage    = 'https://github.com/bryckbost/memdash'

  gem.add_dependency 'memdash', gem.version
  gem.add_dependency 'activerecord', '~> 3.0'

  gem.files         = `git ls-files lib`.split($\).grep(/(active_?record|generators)/)
  gem.require_paths = ['lib']
end

