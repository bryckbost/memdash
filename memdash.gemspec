# encoding: utf-8

Gem::Specification.new do |gem|
  gem.name    = 'memdash'
  gem.version = '0.1.0'

  gem.authors     = ['Brian Ryckbost', 'Steve Richert']
  gem.email       = ['bryckbost@gmail.com', 'steve.richert@gmail.com']
  gem.description = 'A dashboard for your memcache'
  gem.summary     = 'A dashboard for your memcache'
  gem.homepage    = 'https://github.com/bryckbost/memdash'

  gem.add_dependency 'dalli',        '~> 2.0'
  gem.add_dependency 'sinatra',      '~> 1.3'

  gem.add_development_dependency 'activerecord'
  gem.add_development_dependency 'bson_ext'
  gem.add_development_dependency 'mongo_mapper'
  gem.add_development_dependency 'database_cleaner'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'sqlite3'  

  gem.files         = `git ls-files`.split($\).reject{|f| f =~ /(lib\/memdash\-|adapters|generators)/ }
  gem.test_files    = `git ls-files`.split($\).grep(/^spec\//)
  gem.require_paths = ['lib']
end
