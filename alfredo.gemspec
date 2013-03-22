# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'alfredo/version'

Gem::Specification.new do |spec|
  spec.name          = "alfredo"
  spec.version       = Alfredo::VERSION
  spec.authors       = ["Dennis Paagman"]
  spec.email         = ["dennispaagman@gmail.com"]
  spec.description   = %q{Wrapper for Alfred 2's Workflows}
  spec.summary       = %q{Easy generation of XML responses usable in Alfred 2 Workflows}
  spec.homepage      = "https://github.com/springest/alfredo"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.6"  
  spec.add_dependency 'nokogiri'
end
