# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'better_logging/version'

Gem::Specification.new do |spec|
  spec.name          = "better_logging"
  spec.version       = BetterLogging::VERSION
  spec.authors       = ["Tim Cooper"]
  spec.email         = ["coop@latrobest.com"]
  spec.summary       = "Better logging defaults"
  spec.description   = spec.summary
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "json_log_format", "~> 0.0.1"
  spec.add_dependency "lograge"
  spec.add_dependency "rails"
  spec.add_dependency "rails_12factor"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
