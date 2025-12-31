require "zeitwerk"

loader = Zeitwerk::Loader.for_gem
loader.setup

module UnicodeScriptDetector
  class << self
    def detect_characters(string)
      UnicodeScriptDetector::Detector.new(string).characters
    end

    def script_groups(string)
      UnicodeScriptDetector::Detector.new(string).script_groups
    end

    def contains?(string, scripts)
      UnicodeScriptDetector::Detector.new(string).contains?(scripts)
    end

    def contains_only?(string, scripts)
      UnicodeScriptDetector::Detector.new(string).contains_only?(scripts)
    end
  end
end
