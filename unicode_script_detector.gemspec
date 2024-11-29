require_relative "lib/unicode_script_detector/version"

Gem::Specification.new do |spec|
  spec.name        = "unicode_script_detector"
  spec.version     = UnicodeScriptDetector::VERSION
  spec.summary     = "Unicode Script Detector"
  spec.description = "Detect the unicode script per character"
  spec.authors     = ["David Arendsen"]
  spec.email       = "davidarendsen@hey.com"
  spec.files       = Dir["lib/**/*", "MIT-LICENSE", "README.md"] #["lib/detector.rb", "lib/scripts.rb", "lib/character.rb"]
  spec.homepage    = "https://rubygems.org/gems/unicode_script_detector"
  spec.license       = "MIT"
  spec.required_ruby_version = '>= 3.1.0'

  spec.add_dependency "zeitwerk", "~> 2.5"
  spec.add_dependency "activesupport"
end
