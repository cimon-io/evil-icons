# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'purpur/version'

Gem::Specification.new do |spec|
  spec.name          = "purpur"
  spec.version       = Purpur::VERSION
  spec.authors       = ["Alexey Osipenko", "Alexander Madyankin", "Roman Shamin"]
  spec.email         = ["alexey@osipenko.in.ua", "alexander@madyankin.name"]
  spec.summary       = "Purpur is a SVG icons generator for modern web projects"
  spec.description   = "Purpur is a possibility to generate SVG which will use for icons in modern web projects"
  spec.homepage      = "https://github.com/cimon-io/purpur"
  spec.license       = "MIT"
  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri",   "~> 1.6"
  spec.add_dependency "bundler",    "~> 1.6"
  spec.add_dependency "rake",       "~> 10.4"
  spec.add_dependency "uglifier",   "~> 2.7.0"
  spec.add_dependency "csso-rails", "~> 0.3.4"
end
