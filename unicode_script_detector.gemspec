require_relative "lib/unicode_script_detector/version"

Gem::Specification.new do |spec|
  spec.name        = "unicode_script_detector"
  spec.version     = UnicodeScriptDetector::VERSION
  spec.summary     = "Unicode Script Detector"
  spec.description = "Detect the unicode script per character"
  spec.authors     = ["David Arendsen"]
  spec.email       = "davidarendsen@hey.com"
  spec.files       = Dir["lib/**/*", "LICENSE", "README.md"]
  spec.homepage    = "https://github.com/davidarendsen/unicode_script_detector"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage

  spec.required_ruby_version = '>= 3.1.0'

  spec.add_dependency "zeitwerk", "~> 2.5"
  spec.add_dependency "activesupport", "~> 7.2", ">= 7.2.2"
end
