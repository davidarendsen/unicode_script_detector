require "zeitwerk"

loader = Zeitwerk::Loader.for_gem
loader.setup

module UnicodeScriptDetector
  class << self
    def detect_characters(string)
      UnicodeScriptDetector::Detector.new(string).characters
    end

    def contains?(string, scripts)
      UnicodeScriptDetector::Detector.new(string).contains?(scripts)
    end
  end
end