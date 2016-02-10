# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dark_dragon/version'

Gem::Specification.new do |spec|
  spec.homepage      = 'https://rubygems.org/gems/dark_dragon'
  spec.name          = 'dark_dragon'
  spec.version       = DarkDragon::VERSION
  spec.authors       = ['Ben Trevor']
  spec.email         = ['benjamin.trevor@gmail.com']
  spec.description   = 'Brings out the best in sed/awk/xargs.'
  spec.summary       = '{sed,awk,xargs}-like tool with a ruby-like syntax.'
  spec.license       = 'MIT'

  spec.files         = Dir[File.expand_path("lib/**/*.rb")].to_a
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rspec', '~> 3.1'
  spec.add_development_dependency 'pry', '~> 0.10'
end
