require "zeitwerk"

loader = Zeitwerk::Loader.for_gem
loader.setup

module UnicodeScriptDetector
  class << self
    def detect(string)
      UnicodeScriptDetector::Detector.new(string).detect_scripts
    end
  end
end