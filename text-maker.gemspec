# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "textmarker/version"

Gem::Specification.new do |spec|
  spec.name          = "text-marker"
  spec.version       = TextMarker::VERSION
  spec.authors       = ["Geison Goes"]
  spec.email         = ["geisonfgf@gmail.com"]
  spec.summary       = %q{Gem that mark string in a text.}
  spec.description   = %q{Gem that mark string in a text. It is possible mark the text with html tags.}
  spec.homepage      = "https://github.com/geisonfgf/text-marker"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
