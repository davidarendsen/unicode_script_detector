require "zeitwerk"
require "active_support"
require "active_support/core_ext"

loader = Zeitwerk::Loader.for_gem
loader.setup

module UnicodeScriptDetector
  class << self
    def detect(string)
      UnicodeScriptDetector::Detector.new(string).detect_scripts
    end
  end
end