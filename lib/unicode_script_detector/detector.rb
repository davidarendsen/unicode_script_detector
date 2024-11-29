module UnicodeScriptDetector
  class Detector
    def initialize(string)
      @string = string
    end

    def detect_scripts
      scripts = []

      @string.chars.each_with_index do |char, index|
        detected = false
        Scripts::LIST.each_with_index do |script_data, index|
          if char.match?(script_data[:regex])
            scripts << Character.new(char, script_data[:script], script_data[:name])
            detected = true
            break
          end
        end
        scripts << Character.new(char, :Other, "Other") unless detected
      end

      scripts
    end
  end
end