# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "vagrant-down/version"

Gem::Specification.new do |spec|
  spec.name          = "vagrant-down"
  spec.version       = VagrantPlugins::Down::VERSION
  spec.authors       = ["Justin Downing"]
  spec.email         = ["justin@downing.us"]
  spec.description   = %q{Vagrant destroy alias}
  spec.summary       = spec.description
  spec.homepage      = "https://github.com/justindowning/vagrant-down"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
