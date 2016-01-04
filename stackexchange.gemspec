# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stackexchange/version'

Gem::Specification.new do |spec|
  spec.name          = "stackexchange"
  spec.version       = Stackexchange::VERSION
  spec.authors       = ["Marius Rackwitz"]
  spec.email         = ["git@mariusrackwitz.de"]

  spec.summary       = %q{API wrapper to access the StackExchange API conveniently.}
  spec.homepage      = "https://github.com/mrackwitz/StackExchange"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", "~> 0.9.2"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
