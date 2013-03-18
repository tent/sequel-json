# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sequel/plugins/json/version'

Gem::Specification.new do |gem|
  gem.name          = "sequel-json"
  gem.version       = Sequel::Plugins::Json::VERSION
  gem.authors       = ["Jesse Stuart"]
  gem.email         = ["jesse@jessestuart.ca"]
  gem.description   = %q{Sequel ORM Plugin for serializing columns as JSON using Yajl. Build atop Sequel::Plugins::Serialization}
  gem.summary       = %q{Sequel ORM Plugin for serializing columns as JSON using Yajl}
  gem.homepage      = "https://github.com/tent/sequel-json"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'sequel'
  gem.add_runtime_dependency 'yajl-ruby'
end
