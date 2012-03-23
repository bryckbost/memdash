# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.authors       = ["Brian Ryckbost", "Steve Richert"]
  gem.email         = ["bryckbost@gmail.com"]
  gem.description   = %q{Gain insight into your memcached servers}
  gem.summary       = %q{Gain insight into your memcached servers}
  gem.homepage      = ""

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "memdash"
  gem.require_paths = ["lib"]
  gem.version       = "0.0.1"
end
