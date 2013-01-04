# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'flavors/version'

Gem::Specification.new do |gem|
  gem.name          = "flavors"
  gem.version       = Flavors::VERSION
  gem.authors       = ["David Yun", "Richard Lee"]
  gem.email         = ["david.yun@polydice.com", "rl@polydice.com"]
  gem.description   = %q{Simple and flexible preferences integration for ActiveRecord models.}
  gem.summary       = %q{Add preferences to ActiveRecord models.}
  gem.homepage      = "https://github.com/polydice/flavors"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "railties", "~> 3.1"
  gem.add_dependency "activesupport", "~> 3.2"
  gem.add_dependency "activerecord", "~> 3.2"

  gem.add_development_dependency "rspec", "~> 2.12.0"
  gem.add_development_dependency "rake",  "~> 10.0"
  gem.add_development_dependency "shoulda-matchers", "~> 1.4"
  gem.add_development_dependency "sqlite3"
end
