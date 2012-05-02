# encoding: utf-8

Gem::Specification.new do |gem|
  gem.name    = 'memdash-mongo_mapper'
  gem.version = '0.0.1'

  gem.authors     = ['Brian Ryckbost']
  gem.email       = 'bryckbost@gmail.com'
  gem.description = 'A dashboard for your memcached, storing data in MongoMapper.'
  gem.summary     = 'A dashboard for your memcached, storing data in MongoMapper.'
  gem.homepage    = 'https://github.com/bryckbost/memdash'

  gem.add_dependency 'memdash', gem.version
  gem.add_dependency 'mongo_mapper', '~> 0.11'

  gem.files         = `git ls-files lib`.split($\).grep(/(mongo_mapper)/)
  gem.require_paths = ['lib']
end

