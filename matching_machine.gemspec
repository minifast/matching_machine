# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'matching_machine/version'

Gem::Specification.new do |spec|
  spec.name          = "matching_machine"
  spec.version       = MatchingMachine::VERSION
  spec.authors       = ["Doc Ritezel"]
  spec.email         = ["pair+doc@minifast.co"]
  spec.summary       = %q{The RailsConf Guide-to-Scholar Matching Machine}
  spec.description   = %q{It actually doesn't do any matching.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_dependency "thor"
end
